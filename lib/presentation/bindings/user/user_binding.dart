import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sample/data/datasources/user/user_remote_data_source.dart';
import 'package:sample/data/repositories/user/user_repositories_impl.dart';
import 'package:sample/domain/usecases/user/user_use_case.dart';
import 'package:sample/presentation/controllers/user/user_controllers.dart';

class UserBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(Get.find<Dio>()));
    Get.lazyPut<UserRepositoriesImpl>(() => UserRepositoriesImpl(Get.find<UserRemoteDataSource>()));
    Get.lazyPut<UserUseCase>(() => UserUseCase(Get.find<UserRepositoriesImpl>()));
    Get.lazyPut<UserControllers>(() => UserControllers(Get.find<UserUseCase>()));
  }
}