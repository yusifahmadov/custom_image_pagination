import 'package:dartz/dartz.dart';
import 'package:imageproject/core/error/response.dart';

import '../entities/photo.dart';

abstract class PhotoRepository {
  Future<Either<ResponseI, List<Photo>>> getPhotoList(int page);
  Future<Either<ResponseI, Photo>> getOnePhoto(String id);
}
