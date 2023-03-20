import 'dart:async';

import 'flutter_infrared_platform_interface.dart';

// FlutterInfrared
// is a class that provides methods to send IR commands to the device.
class FlutterInfrared {
  static Future<String?> getPlatformVersion() {
    return FlutterInfraredPlatform.instance.getPlatformVersion();
  }

// Send IR command to the device with the given frequency and pattern.
  static Future<void> sendIrCommand(int frequency, List<int> pattern) {
    return FlutterInfraredPlatform.instance.sendIrCommand(frequency, pattern);
  }
}
