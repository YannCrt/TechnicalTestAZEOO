import 'package:flutter/material.dart';
import 'package:azeoosdk/src/notifiers/user_id_notifier.dart';
import 'package:azeoosdk/src/services/user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  bool isLoading = false;

  Future<void> saveUserId() async {
    final idText = controller.text.trim();

    if (idText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Veuillez entrer un ID", textAlign: TextAlign.center),
        ),
      );
      return;
    }

    int parsedId;
    try {
      parsedId = int.parse(idText);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "L'ID doit être un nombre",
            textAlign: TextAlign.center,
          ),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final user = await UserService().getUserById(parsedId);

      userIdNotifier.value = parsedId; // ✅ Mise à jour si succès

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Utilisateur ${user.id} sauvegardé !",
            textAlign: TextAlign.center,
          ),
        ),
      );
    } catch (e) {
      userIdNotifier.value = parsedId; // 🔧 AJOUTEZ CETTE LIGNE

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Utilisateur inexistant", textAlign: TextAlign.center),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }

    try {
      final user = await UserService().getUserById(parsedId);
      userIdNotifier.value = parsedId;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Utilisateur ${user.id} sauvegardé !",
            textAlign: TextAlign.center,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Utilisateur inexistant", textAlign: TextAlign.center),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Entrer l'id de l'utilisateur",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "ID de l'utilisateur",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : saveUserId,
              child: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text("Sauvegarder"),
            ),
          ],
        ),
      ),
    );
  }
}
