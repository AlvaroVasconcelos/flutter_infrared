# flutter_Infrared

A Flutter plugin for sending infrared (IR) commands on Android, iOS, and other platforms. Supports Wi-Fi, Bluetooth, and infrared connections.

## Features

* Send IR commands using the device's built-in infrared emitter (Android only)

## Getting Started

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_infrared: ^0.0.1
```
Then run flutter pub get.

### Usage
Import the package:
```dart

import 'package:flutter_infrared/flutter_infrared.dart';
```
Send an IR command:
```dart

int frequency = 38000;
List<int> pattern = [/* ... */];


await FlutterInfrared.sendCommand(frequency, pattern);

```
### Example

See the example folder for a complete example app demonstrating the plugin's usage.

### Platform Support

Platform	Support
Android	✅


### Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

### License

This plugin is licensed under the MIT License.
