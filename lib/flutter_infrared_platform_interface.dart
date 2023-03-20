import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_infrared_method_channel.dart';

abstract class FlutterInfraredPlatform extends PlatformInterface {
  /// Constructs a FlutterInfraredPlatform.
  FlutterInfraredPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterInfraredPlatform _instance = MethodChannelFlutterInfrared();

  /// The default instance of [FlutterInfraredPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterInfrared].
  static FlutterInfraredPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterInfraredPlatform] when
  /// they register themselves.
  static set instance(FlutterInfraredPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> sendIrCommand(int frequency, List<int> pattern) {
    throw UnimplementedError('sendIrCommand() has not been implemented.');
  }
}
