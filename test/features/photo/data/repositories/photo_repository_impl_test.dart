import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imageproject/core/error/response.dart';
import 'package:imageproject/features/photo/data/data_sources/photo_remote_data_source.dart';
import 'package:imageproject/features/photo/data/models/photo_model.dart';
import 'package:imageproject/features/photo/data/repositories/photo_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/reader/json_reader.dart';
import 'photo_repository_impl_test.mocks.dart';

@GenerateMocks([PhotoRemoteDataSource])
void main() {
  late PhotoRepositoryImpl repository;
  late MockPhotoRemoteDataSource dataSource;
  setUp(() {
    dataSource = MockPhotoRemoteDataSource();
    repository = PhotoRepositoryImpl(remoteDataSource: dataSource);
  });

  group('getPhotoList', () {
    final List<PhotoModel> tPhotos =
        ((jsonDecode(jsonReader('photo_list.json'))) as List<dynamic>)
            .map((e) => PhotoModel.fromJson(e))
            .toList();
    test(
      "should return List<PhotoModel> when getPhotoList is called from dataSource",
      () async {
        when(dataSource.getPhotoList(any)).thenAnswer((_) async => tPhotos);
        final result = await repository.getPhotoList(1);
        verify(dataSource.getPhotoList(1));
        expect(result, Right(tPhotos));
        verifyNoMoreInteractions(dataSource);
      },
    );
    test(
      "should return [Error Response] when getPhotoList is called unsuccessfully",
      () async {
        when(dataSource.getPhotoList(any)).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(
                requestOptions: RequestOptions(), data: 'Error happened!')));
        final result = await repository.getPhotoList(1);
        verify(dataSource.getPhotoList(1));
        expect(result, const Left(ResponseI(message: 'Error happened!')));
      },
    );
    test(
      "should return special [Error Response] message, when getPhotoList is called unsuccessfully (500 error)",
      () async {
        when(dataSource.getPhotoList(any)).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response:
                Response(statusCode: 500, requestOptions: RequestOptions())));
        final result = await repository.getPhotoList(1);
        verify(dataSource.getPhotoList(1));
        expect(result, const Left(ResponseI(message: 'Something is wrong!')));
      },
    );
  });
  group('getOnePhoto', () {
    final PhotoModel tPhoto =
        PhotoModel.fromJson(jsonDecode(jsonReader('photo.json')));

    test(
      "should return PhotoModel when getOnePhoto is called from dataSource",
      () async {
        when(dataSource.getOnePhoto(any)).thenAnswer((_) async => tPhoto);
        final result = await repository.getOnePhoto('KR0WW6bjtt0');
        verify(dataSource.getOnePhoto('KR0WW6bjtt0'));
        expect(result, Right(tPhoto));
        verifyNoMoreInteractions(dataSource);
      },
    );
    test(
      "should return [Error Response] when getPhotoList is called unsuccessfully",
      () async {
        when(dataSource.getOnePhoto(any)).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(
                requestOptions: RequestOptions(), data: 'Error happened!')));
        final result = await repository.getOnePhoto('KR0WW6bjtt0');
        verify(dataSource.getOnePhoto('KR0WW6bjtt0'));
        expect(result, const Left(ResponseI(message: 'Error happened!')));
      },
    );
    test(
      "should return special [Error Response] message, when getPhotoList is called unsuccessfully (500 error)",
      () async {
        when(dataSource.getOnePhoto(any)).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response:
                Response(statusCode: 500, requestOptions: RequestOptions())));
        final result = await repository.getOnePhoto('KR0WW6bjtt0');
        verify(dataSource.getOnePhoto('KR0WW6bjtt0'));
        expect(result, const Left(ResponseI(message: 'Something is wrong!')));
      },
    );
  });
}
