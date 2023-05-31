import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.exit_to_app))
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[700],
              foregroundColor: Colors.black,
              backgroundImage:
                  NetworkImage(user.photoURL == null ? '' : user.photoURL!),
              radius: 25.0,
            ),
            Text(
              user.displayName == null ? 'your name' : user.displayName!,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              user.email!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "LOGGED IN!",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
