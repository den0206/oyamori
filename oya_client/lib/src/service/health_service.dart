import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:health/health.dart';

class HealthService extends GetxService {
  static HealthService get to => Get.find();
  final HealthFactory health = HealthFactory();
  final type = [HealthDataType.STEPS];
  bool request = false;

  Future<void> requestPermission() async {
    final permissions = [
      HealthDataAccess.READ,
    ];

    request = await health.requestAuthorization(type, permissions: permissions);
  }

  Future<int> getDayOfSteps() async {
    if (!request) return -1;
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day, 0, 0, 0);
    final end = DateTime(now.year, now.month, now.day, 23, 59, 59);

    final stepsCount = await health.getTotalStepsInInterval(start, end);

    // final healthData = await health.getHealthDataFromTypes(start, end, type);
    // print(healthData);
    return stepsCount ?? -1;
    // final healthData = await health.getTotalStepsInInterval(start, end);
  }
}
