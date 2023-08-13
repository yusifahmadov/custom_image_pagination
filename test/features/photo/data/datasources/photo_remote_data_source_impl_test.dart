import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imageproject/core/dio/interceptor.dart';
import 'package:imageproject/features/photo/data/data_sources/photo_remote_data_source_impl.dart';
import 'package:imageproject/features/photo/data/models/photo_model.dart';
import 'package:imageproject/features/photo/domain/entities/photo.dart';
import 'package:mock_web_server/mock_web_server.dart';

import '../../../../core/reader/json_reader.dart';

void main() {
  late PhotoRemoteDataSourceImpl remoteDataSourceImpl;
  late MockWebServer server;
  final headers = {'Content-Type': 'application/json'};

  setUp(() {
    server = MockWebServer();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(CustomInterceptor());
    remoteDataSourceImpl = PhotoRemoteDataSourceImpl(dio);
  });
  group('getPhotoList', () {
    final List<Photo> tPhotos =
        ((jsonDecode(jsonReader('photo_list.json'))) as List<dynamic>)
            .map((e) => PhotoModel.fromJson(e))
            .toList();

    test(
      "getPhotoList return List<PhotoModel> successfully",
      () async {
        server.enqueue(
            body: jsonEncode(jsonReader('photo_list.json')), headers: headers);
        final result = await remoteDataSourceImpl.getPhotoList(1);

        expect(result[0].id, tPhotos[0].id);
      },
    );
  });
  group('getOnePhoto', () {
    final PhotoModel tPhoto =
        PhotoModel.fromJson(jsonDecode(jsonReader('photo.json')));
    test(
      "getOnePhoto returnPhotoModel successfully",
      () async {
        server.enqueue(
            body: jsonEncode(jsonReader('photo.json')), headers: headers);
        final result = await remoteDataSourceImpl.getOnePhoto('KR0WW6bjtt0');

        expect(result.id, tPhoto.id);
      },
    );
  });
}
