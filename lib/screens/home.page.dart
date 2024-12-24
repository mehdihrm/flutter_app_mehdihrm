import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut(); // Déconnexion de Firebase
      Navigator.pushReplacementNamed(context, '/login'); // Redirection vers la page de login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You have been logged out.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An error occurred while logging out.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("lib/images/profil.png"),
                    radius: 40,
                  ),
                  Text(
                    user?.displayName ?? "No Name Provided", // Nom d'affichage de l'utilisateur
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    user?.email ?? "No Email Provided", // Email de l'utilisateur
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Image Recognition'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.pink),
            ListTile(
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_forward),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.pink),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Logout'),
              onTap: () async {
                await _logout(); // Appeler la méthode de déconnexion
              },
            ),
            const Divider(color: Colors.pink),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Welcome to home page",
          style: TextStyle(color: Colors.blueAccent, fontSize: 30),
        ),
      ),
    );
  }
}
