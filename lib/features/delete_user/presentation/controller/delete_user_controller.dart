import 'dart:developer';

import 'package:digital_center_app/domains/users/domain/usecases/delete_user_usecase.dart';
import 'package:get/get.dart';

import '../../../../app/theme/theme.dart';

class DeleteUserController extends GetxController with StateMixin<String> {
  final DeleteUserUseCase deleteUserUseCase;

  DeleteUserController(this.deleteUserUseCase);

  var deletedUser = "".obs;
  RxBool isLoading = false.obs;

  deleteUser({required int userId}) async {
    // RxStatus.loading();
    isLoading.value = true;

    final result = await deleteUserUseCase.call(userId);

    return result.fold((failure) => RxStatus.error(failure.errorMessage),
        (data) {
      isLoading.value = false;
      deletedUser.value = data.toString();
      change(deletedUser.value, status: RxStatus.success());

      log("loaded: ${deletedUser.value.toString()}");

      Get.snackbar("Success!!", "User has been deleted", backgroundColor: ColorName.greenColor);
    });
  }
}
