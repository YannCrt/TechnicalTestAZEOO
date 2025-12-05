import 'package:flutter/material.dart';
import 'package:azeoosdk/src/notifiers/user_id_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ✅ ENLÈVE le Scaffold et AppBar, garde juste le contenu
    return Padding(
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
            onPressed: () {
              final id = controller.text.trim();
              if (id.isEmpty) return;

              final parsedId = int.parse(id);

              userIdNotifier.value = parsedId;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Utilisateur $parsedId Sauvegardé !")),
              );
            },
            child: const Text("Sauvegarder"),
          ),
        ],
      ),
    );
  }
}
