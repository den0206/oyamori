import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oyamori/src/app_root.dart';
import 'package:oyamori/src/screen/get_health/get_health_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoot.pages,
      initialRoute: GetHealthScreen.routeName,
    );
  }
}
