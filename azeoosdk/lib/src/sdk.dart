import 'sdk_config.dart';
import 'widgets/main_tabs.dart';
import 'package:flutter/material.dart';

class MySDK {
  static SdkConfig? _config;

  static void init(SdkConfig config) {
    _config = config;
  }

  static SdkConfig get config {
    if (_config == null) {
      throw Exception("MySDK has not been initialized");
    }
    return _config!;
  }

  static Widget getMainTabs() {
    if (_config == null) {
      throw Exception("MySDK.init(config) must be called before getMainTabs()");
    }
    // ✅ ENLÈVE LE const ICI
    return MainTabs();
  }
}
