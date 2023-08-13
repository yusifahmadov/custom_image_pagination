import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:imageproject/core/error/response.dart';
import 'package:imageproject/features/photo/data/data_sources/photo_remote_data_source.dart';
import 'package:imageproject/features/photo/domain/entities/photo.dart';
import 'package:imageproject/features/photo/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  PhotoRemoteDataSource remoteDataSource;
  PhotoRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<ResponseI, List<Photo>>> getPhotoList(int page) async {
    try {
      return Right(await remoteDataSource.getPhotoList(page));
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        return const Left(ResponseI(message: "Something is wrong!"));
      }
      return Left(ResponseI(message: e.response.toString()));
    }
  }

  @override
  Future<Either<ResponseI, Photo>> getOnePhoto(String id) async {
    try {
      return Right(await remoteDataSource.getOnePhoto(id));
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        return const Left(ResponseI(message: "Something is wrong!"));
      }
      return Left(ResponseI(message: e.response.toString()));
    }
  }
}
