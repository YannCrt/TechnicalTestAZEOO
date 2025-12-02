import 'package:flutter/material.dart';
import 'package:technicaltestazeoo/models/user.dart';
import 'package:technicaltestazeoo/services/user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<bool> isLoadedNotifier = ValueNotifier(false);
  final ValueNotifier<List<User>> usersNotifier = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    getUsers(); // appel de la fonction getAllUsers() pour charger tous les utilisateurs.
  }

  getUsers() async {
    var loadedUsers = await UserService()
        .getAllUsers(); // appel de la méthode getAllUsers() du service UserService
    if (loadedUsers != null) {
      usersNotifier.value = loadedUsers;
      isLoadedNotifier.value = true;
    }
  }

  // dsl j'ai mal a la gorge, soit le noir soit le rouge normalement, je ne sais pas, mais je pense que c'est le rouge sinon teste tout.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Technical Test Azéoo')),
      body: ValueListenableBuilder<bool>(
        valueListenable: isLoadedNotifier,
        builder: (context, isLoaded, child) {
          if (!isLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          return ValueListenableBuilder<List<User>>(
            valueListenable: usersNotifier,
            builder: (context, users, child) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text('{$user.first_name} ${user.last_name}'),
                    subtitle: Text('$user.email'),
                    leading: user.countryFlag != null
                        ? Image.network(user.countryFlag!)
                        : null,
                    trailing: Icon(Icons.person),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
