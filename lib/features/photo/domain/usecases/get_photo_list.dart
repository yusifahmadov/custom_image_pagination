import 'package:dartz/dartz.dart';
import 'package:imageproject/core/error/response.dart';
import 'package:imageproject/core/usecase/usecase.dart';
import 'package:imageproject/features/photo/domain/entities/photo.dart';
import 'package:imageproject/features/photo/domain/repositories/photo_repository.dart';

class GetPhotoList extends UseCase<List<Photo>, int> {
  final PhotoRepository photoRepository;

  GetPhotoList({required this.photoRepository});
  @override
  Future<Either<ResponseI, List<Photo>>> call(int params) {
    return photoRepository.getPhotoList(params);
  }
}
