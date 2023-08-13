import 'package:dartz/dartz.dart';
import 'package:imageproject/core/error/response.dart';
import 'package:imageproject/features/photo/domain/entities/photo.dart';
import 'package:imageproject/features/photo/domain/repositories/photo_repository.dart';
import 'package:imageproject/features/photo/domain/usecases/get_photo_list.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_photo_list_usecase_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateMocks([PhotoRepository, Photo])
void main() {
  late GetPhotoList usecase;
  late MockPhotoRepository repository;
  final tList = [MockPhoto(), MockPhoto()];
  setUp(() {
    repository = MockPhotoRepository();
    usecase = GetPhotoList(photoRepository: repository);
  });

  test(
    "should return List<Photo> when data fetched from repository successfully",
    () async {
      when(repository.getPhotoList(any)).thenAnswer((_) async => Right(tList));
      final result = await usecase(1);
      verify(repository.getPhotoList(1));
      expect(result, Right(tList));
    },
  );
  test(
    "should return ResponseI when data fetched from repository failed",
    () async {
      when(repository.getPhotoList(any)).thenAnswer(
        (_) async => const Left(ResponseI(message: 'Error happened!')),
      );
      final result = await usecase(1);
      verify(repository.getPhotoList(1));
      expect(result, const Left(ResponseI(message: 'Error happened!')));
    },
  );
}
