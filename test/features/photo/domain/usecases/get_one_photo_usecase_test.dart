import 'package:dartz/dartz.dart';
import 'package:imageproject/core/error/response.dart';
import 'package:imageproject/features/photo/domain/usecases/get_one_photo.dart';
import 'package:mockito/mockito.dart';
import 'get_photo_list_usecase_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetOnePhoto usecase;
  late MockPhotoRepository repository;
  final tData = MockPhoto();
  setUp(() {
    repository = MockPhotoRepository();
    usecase = GetOnePhoto(repository: repository);
  });

  test(
    "should return Photo when data fetched from repository successfully",
    () async {
      when(repository.getOnePhoto(any)).thenAnswer((_) async => Right(tData));
      final result = await usecase('1');
      verify(repository.getOnePhoto('1'));
      expect(result, Right(tData));
    },
  );
  test(
    "should return ResponseI when data fetched from repository failed",
    () async {
      when(repository.getOnePhoto(any)).thenAnswer(
        (_) async => const Left(ResponseI(message: 'Error happened!')),
      );
      final result = await usecase('1');
      verify(repository.getOnePhoto('1'));
      expect(result, const Left(ResponseI(message: 'Error happened!')));
    },
  );
}
