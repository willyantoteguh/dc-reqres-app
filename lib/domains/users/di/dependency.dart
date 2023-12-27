import 'package:get/get.dart';

import '../data/datasource/remote/users_remote_datasource.dart';
import '../data/mapper/users_mapper.dart';
import '../data/repositories/users_repository_impl.dart';
import '../domain/repositories/users_repository.dart';
import '../domain/usecases/fetch_all_users_usecase.dart';

class UsersDepency {
  UsersDepency() {
    _registerRemoteDataSource();
    _registerMapper();
    _registerRepository();
    _registerUseCase();
  }

  _registerRemoteDataSource() => Get.lazyPut<UsersRemoteDataSource>(
      () => UserRemoteDataSourceImpl(dio: Get.find()),
      fenix: true);

  _registerMapper() => Get.lazyPut<UsersMapper>(() => UsersMapper(), fenix: true);

  _registerRepository() => Get.lazyPut<UsersRepository>(
        () => UserRepositoryImpl(
          usersRemoteDataSource: Get.find(),
          usersMapper: Get.find(),
        ),
        fenix: true
      );

  _registerUseCase() => Get.lazyPut<GetAllUsersUseCase>(
        () => GetAllUsersUseCase(
          usersRepository: Get.find(),
        ),
        fenix: true
      );
}
