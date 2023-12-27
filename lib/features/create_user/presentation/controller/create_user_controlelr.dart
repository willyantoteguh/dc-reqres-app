import 'dart:developer';
import 'package:get/get.dart';

import '../../../../app/theme/theme.dart';
import '../../../../domains/users/domain/entities/request/user_request_entity.dart';
import '../../../../domains/users/domain/entities/response/create_user_entity.dart';
import '../../../../domains/users/domain/usecases/add_user_usecase.dart';

class CreateUserController extends GetxController
    with StateMixin<CreateUserEntity> {
  final AddUserUseCase addUserUseCase;

  CreateUserController(this.addUserUseCase);

  var newUser = Rx<CreateUserEntity?>(null);
  RxBool isLoading = false.obs;

  addUserData({required UserRequestEntity userRequestEntity}) async {
    // RxStatus.loading();
    isLoading.value = true;

    final result = await addUserUseCase.call(userRequestEntity);

    return result.fold((failure) => RxStatus.error(failure.errorMessage),
        (data) {
      isLoading.value = false;
      newUser.value = data;
      // change(newUser.value, status: RxStatus.success());

      log("loaded: ${newUser.value.toString()}");

      Get.snackbar("Success!!", "User ${newUser.value?.name} has been added", backgroundColor: ColorName.greenColor);
    });
  }
}
