import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:imageproject/features/photo/domain/usecases/get_one_photo.dart';
import 'package:imageproject/features/photo/domain/usecases/get_photo_list.dart';
import 'package:imageproject/features/photo/presentation/cubit/photo_cubit.dart';

import 'core/dio/interceptor.dart';
import 'features/photo/data/data_sources/photo_remote_data_source.dart';
import 'features/photo/data/data_sources/photo_remote_data_source_impl.dart';
import 'features/photo/data/repositories/photo_repository_impl.dart';
import 'features/photo/domain/repositories/photo_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  initUseCases();
  initCubits();
  initDataSources();
  initRepositories();

  initExternals();
}

initCubits() {
  getIt.registerFactory(
      () => PhotoCubit(getPhotoList: getIt(), getOnePhoto: getIt()));
}

initDataSources() {
  getIt.registerLazySingleton<PhotoRemoteDataSource>(
      () => PhotoRemoteDataSourceImpl(getIt()));
}

initUseCases() {
  getIt.registerLazySingleton(() => GetPhotoList(photoRepository: getIt()));
  getIt.registerLazySingleton(() => GetOnePhoto(repository: getIt()));
}

initRepositories() {
  getIt.registerLazySingleton<PhotoRepository>(
      () => PhotoRepositoryImpl(remoteDataSource: getIt()));
}

final navigatorKey = GlobalKey<NavigatorState>();
final mainContext = navigatorKey.currentContext;
initExternals() {
  getIt.registerLazySingleton(() => navigatorKey);

  getIt.registerLazySingleton(
      () => Dio()..interceptors.add(CustomInterceptor()));
}
