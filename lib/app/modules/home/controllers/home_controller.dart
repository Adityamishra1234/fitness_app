


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  var steps = 0.obs;
  var calories = 0.0.obs;

  final Health _health = Health();

  final List<HealthDataType> _types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  @override
  void onInit() {
    super.onInit();
    fetchHealthConnectData();
  }

  Future<void> fetchHealthConnectData() async {
    await _health.configure();

    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    await _requestPermissions();

    final isInstalled = await _health.isHealthConnectAvailable();

    final hasPermissions = await _health.hasPermissions(_types);

    if (!hasPermissions!) {
      final authorized = await _health.requestAuthorization(
        _types,
        permissions: [HealthDataAccess.READ, HealthDataAccess.READ],
      );
      debugPrint("Authorized? $authorized");

      if (!authorized) {
        debugPrint("Authorization failed.");
        return;
      }
    }

    try {
      //fetching step counts
      final stepCount = await _health.getTotalStepsInInterval(now.subtract(Duration(hours: 24)), now);
      steps.value = stepCount ?? 1;

      //fetching calories burned from last week
      final lastWeek= now.subtract(Duration(days: 7));
      final healthData = await _health.getHealthDataFromTypes(
        types: [HealthDataType.ACTIVE_ENERGY_BURNED],
        startTime: lastWeek,
        endTime: now,
      );
      debugPrint("healthData = $healthData");

      double totalCalories = 0.0;
      for (final data in healthData) {
        if (data.value is NumericHealthValue) {
          totalCalories += (data.value as NumericHealthValue).numericValue.toDouble();
        }
      }
      calories.value = totalCalories;
    } catch (e) {
      debugPrint("Error fetching health data: $e");
    }
  }

  Future<void> _requestPermissions() async {
    final statusActivityRecognition = await Permission.activityRecognition.request();
    final statusSensors = await Permission.sensors.request();

    if (statusActivityRecognition.isGranted && statusSensors.isGranted) {
      debugPrint("Runtime permissions granted!");
    } else {
      debugPrint("Runtime permissions denied!");
    }
  }
}
