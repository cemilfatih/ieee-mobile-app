
class VersionManager {

  final String deviceVersion;
  final String databaseVersion;

  VersionManager({required this.deviceVersion, required this.databaseVersion});

  bool isNeedForUpdate() {
    final deviceVersionSplitted = deviceVersion.split('.').join();
    final databaseVersionSplitted = databaseVersion.split('.').join();

    final deviceNumber = int.tryParse(deviceVersionSplitted);
    final databaseNumber = int.tryParse(databaseVersionSplitted);

    if (deviceNumber == null || databaseNumber == null) {
      throw Exception('Version Error');
    }

    return databaseNumber <= deviceNumber;
  }
}