import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_infrared_platform_interface.dart';

/// An implementation of [FlutterInfraredPlatform] that uses method channels.
class MethodChannelFlutterInfrared extends FlutterInfraredPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_infrared');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

// Send IR command to the device with the given frequency and pattern.
  @override
  Future<void> sendIrCommand(int frequency, List<int> pattern) async {
    await methodChannel.invokeMethod('sendIrCommand', {
      'frequency': frequency,
      'pattern': pattern,
    });
  }
}
