import 'package:imageproject/features/photo/data/models/photo_model.dart';

abstract class PhotoRemoteDataSource {
  Future<List<PhotoModel>> getPhotoList(int page);
  Future<PhotoModel> getOnePhoto(String id);
}
