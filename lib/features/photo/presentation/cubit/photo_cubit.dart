import 'package:imageproject/features/photo/domain/entities/photo.dart';
import 'package:imageproject/features/photo/domain/usecases/get_one_photo.dart';
import 'package:imageproject/features/photo/domain/usecases/get_photo_list.dart';
import 'package:imageproject/features/photo/presentation/cubit/photo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoCubit extends Cubit<PhotoState> {
  final GetPhotoList getPhotoList;
  final GetOnePhoto getOnePhoto;
  PhotoCubit({required this.getPhotoList, required this.getOnePhoto})
      : super(PhotoInitial());
  static List<Photo> list = [];
  static int _page = 1;
  getPhotoListFunc() async {
    if (state is PhotoDataLoading) return;

    emit(PhotoDataLoading(
      data: list,
    ));
    final result = await getPhotoList(_page);
    result.fold((l) => emit(PhotoDataFailed(data: l)), (r) {
      _page++;

      list.addAll(r);

      emit(PhotoDataLoaded(data: list));
    });
  }

  getOnePhotoFunc(String id) async {
    emit(OnePhotoDataLoading());
    final result = await getOnePhoto(id);
    result.fold((l) => emit(OnePhotoDataFailed(data: l)),
        (r) => emit(OnePhotoDataLoaded(data: r)));
  }
}
