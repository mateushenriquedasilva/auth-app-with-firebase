import 'package:auth_app_with_firebase/components/my_button.dart';
import 'package:auth_app_with_firebase/components/my_textfield.dart';
import 'package:flutter/material.dart';

import '../components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sing in user
  void singUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 50),
            // logo
            const Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(height: 50),
            // message
            Text(
              "welcome back you\'ve been missed!",
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            const SizedBox(height: 50),
            MyTextfiled(
              controller: usernameController,
              hintText: "Username",
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextfiled(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            MyButton(
              onTap: singUserIn,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imgPath: 'lib/images/google.png'),
                SizedBox(width: 25),
                SquareTile(imgPath: 'lib/images/apple.png')
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                const Text(
                  "Register now",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
