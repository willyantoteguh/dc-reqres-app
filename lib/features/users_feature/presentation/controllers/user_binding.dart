import 'package:get/get.dart';

import '../../../../domains/users/domain/repositories/users_repository.dart';
import '../../../../domains/users/domain/usecases/add_user_usecase.dart';
import '../../../../domains/users/domain/usecases/delete_user_usecase.dart';
import '../../../../domains/users/domain/usecases/fetch_all_users_usecase.dart';
import '../../../../domains/users/domain/usecases/update_user_usecase.dart';
import '../../../create_user/presentation/controller/create_user_controlelr.dart';
import '../../../delete_user/presentation/controller/delete_user_controller.dart';
import '../../../update_user/presentation/controller/update_user_controlelr.dart';
import 'user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    // Read
    Get.lazyPut(
        () => GetAllUsersUseCase(usersRepository: Get.find<UsersRepository>()));
    Get.put(UserController(Get.find()), permanent: true);

    // Create
    Get.lazyPut(
        () => AddUserUseCase(usersRepository: Get.find<UsersRepository>()));
    Get.put(CreateUserController(Get.find()), permanent: true);

    // Update
    Get.lazyPut(
        () => UpdateUserUseCase(usersRepository: Get.find<UsersRepository>()));
    Get.put(UpdateUserController(Get.find()), permanent: true);

    // Delete
    Get.lazyPut(
        () => DeleteUserUseCase(usersRepository: Get.find<UsersRepository>()));
    Get.put(DeleteUserController(Get.find()), permanent: true);
  }
}
