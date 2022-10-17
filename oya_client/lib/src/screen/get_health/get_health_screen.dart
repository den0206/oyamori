import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oyamori/src/screen/get_health/get_health_controller.dart';

class GetHealthScreen extends StatelessWidget {
  const GetHealthScreen({super.key});

  static const routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: GetBuilder<GetHealthController>(
        init: GetHealthController(),
        builder: (controller) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${controller.stepsCount}"),
                ElevatedButton(
                  onPressed: () async {
                    await controller.registerPeriodic();
                  },
                  child: const Text("getData"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await controller.loadSteps();
                  },
                  child: const Text("update"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
