import 'dart:developer';
import 'package:get/get.dart';

import '../../../../app/theme/theme.dart';
import '../../../../domains/users/domain/entities/request/user_request_entity.dart';
import '../../../../domains/users/domain/entities/response/update_user_entity.dart';
import '../../../../domains/users/domain/usecases/update_user_usecase.dart';

class UpdateUserController extends GetxController
    with StateMixin<UpdateUserEntity> {
  final UpdateUserUseCase updateUserUseCase;

  UpdateUserController(this.updateUserUseCase);

  var updatedUser = Rx<UpdateUserEntity?>(null);
  RxBool isLoading = false.obs;

  updateUserData({required UserRequestEntity userRequestEntity}) async {
    // RxStatus.loading();
    isLoading.value = true;

    final result = await updateUserUseCase.call(userRequestEntity);

    return result.fold((failure) => RxStatus.error(failure.errorMessage),
        (data) {
      isLoading.value = false;
      updatedUser.value = data;
      change(updatedUser.value, status: RxStatus.success());

      log("loaded: ${updatedUser.value.toString()}");

      Get.snackbar("Success!!", "User ${updatedUser.value?.name} has been updated", backgroundColor: ColorName.greenColor);
    });
  }
}
