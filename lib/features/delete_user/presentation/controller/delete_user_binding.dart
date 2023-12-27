import 'package:get/get.dart';

import '../../../../domains/users/domain/repositories/users_repository.dart';
import '../../../../domains/users/domain/usecases/delete_user_usecase.dart';
import 'delete_user_controller.dart';

class DeleteUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => DeleteUserUseCase(usersRepository: Get.find<UsersRepository>()));
    Get.put(DeleteUserController(Get.find()), permanent: true);
  }
}
