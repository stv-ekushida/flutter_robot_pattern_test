// Dart imports:
import 'dart:developer';
import 'dart:io';

// Package imports:
import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  const path = "test_driver/screenshots";

  final FlutterDriver driver = await FlutterDriver.connect();
  try {
    await integrationDriver(
      driver: driver,
      onScreenshot: (String screenshotName, List<int> screenshotBytes,
          [Map<String, Object?>? args]) async {
        final File image = File('$path/$screenshotName.png');
        image.writeAsBytesSync(screenshotBytes);

        return true;
      },
    );
  } catch (e) {
    log(e.toString());
  }
}
