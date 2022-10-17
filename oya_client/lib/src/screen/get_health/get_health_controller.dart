import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oyamori/src/service/health_service.dart';
import 'package:oyamori/src/service/storage_service.dart';
import 'package:workmanager/workmanager.dart';

class GetHealthController extends GetxController {
  final healthService = HealthService.to;
  List stepsCount = [];

  Future<void> loadSteps() async {
    final currentSteps = await StorageKey.steps.loadNumbers();
    stepsCount = currentSteps;

    update();
  }

  Future<void> registerPeriodic() async {
    await healthService.requestPermission();
    await Workmanager().registerPeriodicTask(
      "1",
      Workmanager.iOSBackgroundTask,
      initialDelay: const Duration(seconds: 5),
      frequency: const Duration(hours: 1),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }
}
