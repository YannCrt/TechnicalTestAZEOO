import 'package:flutter/material.dart';
import 'package:azeoosdk/azeoosdk.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Initialise le SDK
    MySDK.init(
      SdkConfig(baseUrl: ApiConfig.baseUrl, token: ApiConfig.apiToken),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      // ✅ Affiche seulement le profil (pas les tabs)
      home: Scaffold(body: MySDK.getProfileView()),
    );
  }
}
