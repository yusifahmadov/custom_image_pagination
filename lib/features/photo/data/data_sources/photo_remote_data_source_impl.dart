import 'package:dio/dio.dart';
import 'package:imageproject/features/photo/data/data_sources/photo_remote_data_source.dart';
import 'package:imageproject/features/photo/data/models/photo_model.dart';
import 'package:retrofit/retrofit.dart';
part 'photo_remote_data_source_impl.g.dart';

@RestApi(baseUrl: "https://api.unsplash.com/photos/")
abstract class PhotoRemoteDataSourceImpl extends PhotoRemoteDataSource {
  factory PhotoRemoteDataSourceImpl(Dio dio) = _PhotoRemoteDataSourceImpl;

  @override
  @GET('?page={page}')
  Future<List<PhotoModel>> getPhotoList(@Path() int page);

  @override
  @GET("{id}")
  Future<PhotoModel> getOnePhoto(@Path("id") String id);
}
