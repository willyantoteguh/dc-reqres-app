import 'dart:developer';

import 'package:get/get.dart';

import '../../../../domains/users/domain/entities/response/user_entity.dart';
import '../../../../domains/users/domain/usecases/fetch_all_users_usecase.dart';
import '../../../create_user/presentation/controller/create_user_binding.dart';
import '../../../create_user/presentation/controller/create_user_controlelr.dart';
import '../../../delete_user/presentation/controller/delete_user_binding.dart';
import '../../../delete_user/presentation/controller/delete_user_controller.dart';
import '../../../update_user/presentation/controller/update_user_binding.dart';
import '../../../update_user/presentation/controller/update_user_controlelr.dart';

class UserController extends GetxController with StateMixin<UserEntity> {
  final GetAllUsersUseCase getAllUsersUseCase;

  UserController(this.getAllUsersUseCase);

  var users = Rx<UserEntity?>(null);

  var createController;
  var updateController;
  var deleteController;

  @override
  void onInit() {
    super.onInit();

    getAllUserData(page: 1).then((value) {
      // findOtherBinding();
    });
  }



  Future<void> getAllUserData({required int page}) async {
    RxStatus.loading();

    final result = await getAllUsersUseCase.call(page);

    return result.fold((failure) => RxStatus.error(failure.errorMessage),
        (data) {
      users.value = data;
      change(users.value, status: RxStatus.success());

      log("loaded: ${users.value.toString()}");
    });
  }
}
