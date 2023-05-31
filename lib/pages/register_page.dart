import 'package:auth_app_with_firebase/components/my_button.dart';
import 'package:auth_app_with_firebase/components/my_textfield.dart';
import 'package:auth_app_with_firebase/components/square_tile.dart';
import 'package:auth_app_with_firebase/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void singUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        showToast("Passwords are not the same!",
            duration: 2, gravity: Toast.bottom);
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      switch (e.code) {
        case 'weak-password':
          showToast("Password needs at least 6 characters!",
              duration: 2, gravity: Toast.bottom);
          break;
        case 'email-already-in-use':
          showToast("Email already in use!",
              duration: 2, gravity: Toast.bottom);
          break;
        case 'invalid-email':
          showToast("Invalid email!", duration: 2, gravity: Toast.bottom);
          break;
        default:
          showToast("There was an error!", duration: 2, gravity: Toast.bottom);
          break;
      }
    }
  }

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 30),
              // logo
              const Icon(
                Icons.account_circle,
                size: 100,
              ),
              const SizedBox(height: 30),
              // message
              Text(
                "Create an account on our app!",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(height: 50),
              MyTextfiled(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextfiled(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              MyTextfiled(
                controller: confirmPasswordController,
                hintText: "Confirm password",
                obscureText: true,
              ),
              const SizedBox(height: 20),
              MyButton(
                onTap: singUserUp,
                textButton: "Sing Up",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imgPath: 'lib/images/google.png',
                    onTap: () => AuthService().signInWithGoogle(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
