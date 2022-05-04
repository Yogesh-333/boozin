import 'package:health/health.dart';

class HealthService {
  static HealthFactory health = HealthFactory();

  static Future<List<HealthDataPoint>> fetchHealthData() async {

    final nowDate = DateTime.now();
    final yesterdayDate = nowDate.subtract(const Duration(days: 1));
    List<HealthDataPoint> healthData = [];

    final types = [
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.BLOOD_GLUCOSE
    ];
    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];

    bool requested =
        await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      healthData = await health.getHealthDataFromTypes(yesterdayDate, nowDate, types);
    } else {
      throw AuthenticationRequired();
    }
    return healthData;
  }
}

class AuthenticationRequired extends Error {}
