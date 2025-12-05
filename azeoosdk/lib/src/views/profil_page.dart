import 'package:flutter/material.dart';
import 'package:azeoosdk/src/notifiers/user_id_notifier.dart';
import 'package:azeoosdk/src/services/user_service.dart';
import 'package:azeoosdk/src/models/user.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: userIdNotifier,
      builder: (context, userId, _) {
        if (userId == null) {
          return const Center(
            child: Text(
              "Aucun utilisateur choisi",
              textAlign: TextAlign.center,
            ),
          );
        }

        return FutureBuilder<User>(
          key: ValueKey(userId),
          future: UserService().getUserById(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "L'utilisateur n'existe pas",
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                    fontSize: 20,
                  ),
                ),
              );
            }

            final user = snapshot.data!;

            final profilePic =
                (user.picture != null && user.picture!.isNotEmpty)
                ? user.picture!.first.url
                : null;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: profilePic != null
                            ? NetworkImage(profilePic)
                            : null,
                        child: profilePic == null
                            ? const Icon(Icons.person, size: 60)
                            : null,
                      ),
                      const SizedBox(height: 20),

                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        user.email,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        "ID : ${user.id}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        "Anniversaire : ${user.birthday?.value ?? 'Pas de date'}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        "Genre : ${user.gender ?? 'Non spécifié'}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        "Information : ${user.info ?? 'Aucune information'}",
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      if (user.countryFlag != null)
                        Image.network(
                          user.countryFlag!,
                          width: 50,
                          height: 50,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.flag, size: 40),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
