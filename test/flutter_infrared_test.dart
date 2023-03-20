import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_infrared/flutter_infrared.dart';
import 'package:flutter_infrared/flutter_infrared_platform_interface.dart';
import 'package:flutter_infrared/flutter_infrared_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterInfraredPlatform
    with MockPlatformInterfaceMixin
    implements FlutterInfraredPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> sendIrCommand(int frequency, List<int> pattern) {
    return Future.value();
  }
}

void main() {
  final FlutterInfraredPlatform initialPlatform =
      FlutterInfraredPlatform.instance;

  test('$MethodChannelFlutterInfrared is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterInfrared>());
  });

  test('getPlatformVersion', () async {
    MockFlutterInfraredPlatform fakePlatform = MockFlutterInfraredPlatform();
    FlutterInfraredPlatform.instance = fakePlatform;

    expect(await FlutterInfrared.getPlatformVersion(), '42');
  });
  test('sendIrCommand', () async {
    MockFlutterInfraredPlatform fakePlatform = MockFlutterInfraredPlatform();
    FlutterInfraredPlatform.instance = fakePlatform;

    expect(() => FlutterInfrared.sendIrCommand(100, [100, 100]), null);
  });
}
