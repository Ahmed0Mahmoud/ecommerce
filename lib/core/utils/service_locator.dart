import 'package:dio/dio.dart';
import 'package:ecommerce/core/utils/storage_helper.dart';
import 'package:ecommerce/features/auth/data/repos/auth_repo.dart';
import 'package:ecommerce/features/home/data/repos/home_repo.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_consumer.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => StorageHelper());

  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));

   getIt.registerSingleton<AuthRepo>(AuthRepo(api: getIt.get<DioConsumer>()));

   getIt.registerSingleton<HomeRepo>(HomeRepo(api: getIt.get<DioConsumer>()));
}
