import 'package:flutter/material.dart';

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
              onPressed: () {},
              icon: const Icon(Icons.login_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
