import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Welcome'),
            IconButton(
              onPressed: () => AuthController.instance.logout(),
              icon: const Icon(Icons.login_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
