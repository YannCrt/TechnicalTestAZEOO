import 'package:flutter/material.dart';
import 'package:azeoosdk/src/views/home_page.dart';
import 'package:azeoosdk/src/views/profil_page.dart';

class MainTabs extends StatelessWidget {
  const MainTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: "Rechercher un utilisateur"),
              Tab(icon: Icon(Icons.person), text: "Profil"),
            ],
          ),
        ),
        body: const TabBarView(children: [HomePage(), ProfilPage()]),
      ),
    );
  }
}
