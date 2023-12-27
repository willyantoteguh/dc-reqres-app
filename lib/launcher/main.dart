import 'package:flutter/material.dart';

import '../app/flavor/app_flavor.dart';
import '../injections/injections.dart';
import 'main_app.dart';

void main() async {
  Config.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  await Injections().initialize();

  runApp(const MainApp());
}
