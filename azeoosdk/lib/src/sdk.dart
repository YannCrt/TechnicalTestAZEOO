import 'package:azeoosdk/src/widgets/main_tabs.dart';

import 'sdk_config.dart';
import 'views/profil_page.dart';
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

  // ✅ NOUVELLE MÉTHODE : retourne seulement le profil
  static Widget getProfileView() {
    if (_config == null) {
      throw Exception(
        "MySDK.init(config) must be called before getProfileView()",
      );
    }
    return const MainTabs(); // envoyer à l'app react native mes données
  }
}
