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
          return const Center(child: Text("Aucun utilisateur choisi"));
        }

        return FutureBuilder<User>(
          key: ValueKey(userId),
          future: UserService().getUserById(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Erreur : ${snapshot.error}",
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            }

            final user = snapshot.data!;

            // UNE SEULE PHOTO
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
                      // --- PHOTO DE PROFIL ---
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            (profilePic != null && profilePic!.isNotEmpty)
                            ? NetworkImage(profilePic!)
                            : null,
                        child: (profilePic == null || profilePic!.isEmpty)
                            ? const Icon(Icons.person, size: 60)
                            : null,
                      ),

                      const SizedBox(height: 20),

                      // --- INFOS ---
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
                        "Birthday : ${user.birthday?.value ?? 'Pas de date'}",
                        style: const TextStyle(fontSize: 18),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Gender : ${user.gender ?? 'Non spécifié'}",
                        style: const TextStyle(fontSize: 18),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Info : ${user.info ?? 'Aucune information'}",
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 16),

                      // --- FLAG ---
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
