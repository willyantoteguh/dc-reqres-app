import 'dart:developer';

import 'package:digital_center_app/app/theme/theme.dart';
import 'package:digital_center_app/domains/users/domain/entities/request/user_request_entity.dart';
import 'package:digital_center_app/domains/users/domain/entities/response/user_entity.dart';
import 'package:digital_center_app/features/users_feature/presentation/widgets/reusable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../create_user/presentation/controller/create_user_controlelr.dart';
import '../../../delete_user/presentation/controller/delete_user_controller.dart';
import '../../../update_user/presentation/controller/update_user_controlelr.dart';
import '../controllers/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  final controller = Get.find<UserController>();
  final createController = Get.find<CreateUserController>();
  final updateController = Get.find<UpdateUserController>();
  final deleteController = Get.find<DeleteUserController>();

  final nameController = TextEditingController();
  final jobController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    jobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Newyork Clubs',
              style:
                  BaseText.whiteText14.copyWith(fontWeight: BaseText.semiBold)),
          backgroundColor: Colors.black,
          actions: const [],
        ),
        body: controller.obx(
          onLoading: _buildReusableLoading(),
          onError: (e) => Center(child: Text(e.toString())),
          (state) {
            final usersData = state;
            final listOfusers = usersData?.data ?? [];

            return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: listOfusers.length,
                itemBuilder: (context, index) {
                  var item = listOfusers[index];

                  return Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: const ScrollMotion(),

                      // A pane can dismiss the Slidable.
                      dismissible: DismissiblePane(onDismissed: () {}),

                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (context) {
                            reusableBottomSheet(
                                context,
                                showContent(
                                    title: "update", name: item.firstName));
                          },
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Update',
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            deleteController.deleteUser(userId: item.id);
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.avatar),
                      ),
                      title: Text("${item.firstName} ${item.lastName}",
                          style: BaseText.blackText12
                              .copyWith(fontWeight: BaseText.medium)),
                      subtitle: Text(item.email, style: BaseText.blackText10),
                    ),
                  );
                });
          },
        ),
        floatingActionButton: Obx(
          () => (createController.isLoading.value)
              ? _buildReusableLoading()
              : FloatingActionButton(
                  onPressed: () {
                    reusableBottomSheet(
                        context, showContent(title: "add", name: ""));
                  },
                  backgroundColor: Colors.black,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
        ));
  }

  Center _buildReusableLoading() =>
      const Center(child: CircularProgressIndicator.adaptive());

  Widget showContent({required String title, required String name}) {
    return StatefulBuilder(builder: (context, newState) {
      return AnimatedPadding(
        duration: const Duration(seconds: 1),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        curve: Curves.easeInOut,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                (title.toLowerCase().contains("update"))
                    ? Text("Update User $name", style: BaseText.blackText14)
                    : Text("Create New User", style: BaseText.blackText14),
                const SizedBox(height: 16),
                Text("Name", style: BaseText.blackText12),
                const SizedBox(height: 6),
                reusableTextField(nameController, "Input Name"),
                const SizedBox(height: 16),
                Text("Job", style: BaseText.blackText12),
                reusableTextField(jobController, "Input Job"),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (nameController.text.isNotEmpty &&
                            jobController.text.isNotEmpty) {
                          UserRequestEntity userRequestEntity =
                              UserRequestEntity(name: nameController.text, job: jobController.text);

                          if (title.toLowerCase().contains("update")) {
                            updateController.updateUserData(
                                userRequestEntity: userRequestEntity);
                          } else {
                            createController.addUserData(
                                userRequestEntity: userRequestEntity);
                          }
                        } else {
                          Get.snackbar("Failed, Empty field",
                              "Please fill in all fields",
                              backgroundColor: Colors.red.shade800);
                        }
                      },
                      color: Colors.black,
                      minWidth: MediaQuery.of(context).size.width / 2,
                      height: 45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "Submit",
                        style: BaseText.whiteText12
                            .copyWith(fontWeight: BaseText.semiBold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ),
      );
    });
  }

  TextField reusableTextField(
      TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration.collapsed(
          border: const UnderlineInputBorder(),
          hintText: hintText,
          hintStyle: BaseText.blackText10),
    );
  }
}
