
import 'package:dio/dio.dart';
import 'package:ecommerce/core/utils/storage_helper.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_consumer.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(()=> StorageHelper());

  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));

 // getIt.registerSingleton<AuthRepo>(AuthRepo(api: getIt.get<DioConsumer>()));


}