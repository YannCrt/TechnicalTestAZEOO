import 'package:flutter/material.dart';
import 'package:technicaltestazeoo/views/home_page.dart';
import 'package:technicaltestazeoo/views/main_tabs.dart';
import 'package:technicaltestazeoo/views/profil_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'technicaltestazeoo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainTabs(),
    );
  }
}
