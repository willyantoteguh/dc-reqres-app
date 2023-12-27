import 'package:digital_center_app/app/flavor/app_flavor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/users_feature/presentation/controllers/user_binding.dart';
import '../features/users_feature/presentation/screens/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: Config.isDebug,
      initialRoute: "/",
      initialBinding: UserBinding(),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: "/home", page: () =>  const HomeScreen())
      ],
    );
  }
}
