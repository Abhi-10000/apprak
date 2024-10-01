class Device {
  final String ssid;
  final String password;
  final String deviceName;
  Map<String, String> pinAssignments;

  Device({
    required this.ssid,
    required this.password,
    required this.deviceName,
    required this.pinAssignments,
  });
}
