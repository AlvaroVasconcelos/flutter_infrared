import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_infrared/flutter_infrared.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDeviceOn = false;

  Future<void> _sendIrCommand() async {
    const frequency = 38000;
    final pattern = <int>[
      4500,
      4500,
      560,
      1690,
      560,
      1690,
      560,
      1690,
      560,
      560,
      560,
      1690,
      560,
      1690,
      560,
      1690,
      560,
      1690,
      560,
      560,
      560,
      560,
      560,
      1690,
      560,
      560,
      560,
      1690,
      560,
      1690,
      560,
      560,
      560,
      1690,
      560,
      1690,
      560,
      1690,
      560,
      1690,
      560,
      1690,
      560,
      560
    ];

    try {
      await FlutterInfrared.sendIrCommand(frequency, pattern);
      setState(() {
        _isDeviceOn = !_isDeviceOn;
      });
    } on PlatformException {
      log('Error sending IR command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Infrared Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Device is ${_isDeviceOn ? 'On' : 'Off'}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendIrCommand,
                child: const Text('Toggle Device Power'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
