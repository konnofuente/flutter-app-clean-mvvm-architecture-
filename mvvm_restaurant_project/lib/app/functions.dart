import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

import '../domain/models/device_info.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = 'unknown';
  String identifier = 'unknown';
  String version = 'unknown';

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

try {
  if (Platform.isAndroid) {
    var build = await deviceInfoPlugin.androidInfo;
    name = "${build.brand} ${build.model}";
    identifier = build.androidId;
    version = build.version.codename;
  } else if (Platform.isIOS) {
    var build = await deviceInfoPlugin.iosInfo;
    name = "${build.name} ${build.model}";
    identifier = build.identifierForVendor;
    version = build.systemVersion;
  }
} on PlatformException {
  print('Failed to get platform version');
}

return DeviceInfo(name: name, identifier: identifier, version: version);

}
