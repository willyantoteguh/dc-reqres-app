
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../flavor/app_flavor.dart';
import '../network/dio_handler.dart';

class RegisterCoreModule {
  RegisterCoreModule() {
    _register();
  }

  void _register() {
    Get.lazyPut<Dio>(() => DioHandler(apiBaseUrl: Config.baseUrl).dio);
    Get.lazyPut<DioHandler>(() => DioHandler(apiBaseUrl: Config.baseUrl));
  }
}