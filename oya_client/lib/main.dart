import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyamori/src/app_root.dart';
import 'package:oyamori/src/screen/get_health/get_health_screen.dart';
import 'package:oyamori/src/service/health_service.dart';
import 'package:oyamori/src/service/storage_service.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case Workmanager.iOSBackgroundTask:
        final currentStep = await HealthService.to.getDayOfSteps();
        final steps = await StorageKey.steps.loadNumbers();
        steps.add(currentStep);
        await StorageKey.steps.saveNumbers(steps);
        break;
    }
    bool success = true;
    return Future.value(success);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  Get.put(HealthService());

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
