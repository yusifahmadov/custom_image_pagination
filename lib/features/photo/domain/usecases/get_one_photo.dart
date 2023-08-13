import 'package:dartz/dartz.dart';
import 'package:imageproject/core/error/response.dart';
import 'package:imageproject/core/usecase/usecase.dart';
import 'package:imageproject/features/photo/domain/entities/photo.dart';
import 'package:imageproject/features/photo/domain/repositories/photo_repository.dart';

class GetOnePhoto extends UseCase<Photo, String> {
  PhotoRepository repository;
  GetOnePhoto({required this.repository});
  @override
  Future<Either<ResponseI, Photo>> call(String params) async {
    return await repository.getOnePhoto(params);
  }
}
