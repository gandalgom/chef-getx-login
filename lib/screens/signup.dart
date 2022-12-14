import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.card_travel_outlined,
                    color: Colors.deepPurple,
                    size: 100.0,
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    'Hello',
                    style: GoogleFonts.bebasNeue(fontSize: 36.0),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Thank you for join us',
                    style: GoogleFonts.bebasNeue(fontSize: 28.0),
                  ),
                  const SizedBox(height: 48.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: ElevatedButton(
                      onPressed: () => AuthController.instance.register(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        onFailure: (message) => displaySnackBar(message),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text('Sign up'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already registered?'),
                      const SizedBox(width: 2.0),
                      TextButton(
                        onPressed: () => Get.back(),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Go back Login page!'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void displaySnackBar(String message) {
    Get.snackbar(
      'title',
      'message',
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      titleText: const Text(
        'Registration is failed',
        style: TextStyle(color: Colors.white),
      ),
      messageText: Text(message, style: const TextStyle(color: Colors.white)),
    );
  }
}
