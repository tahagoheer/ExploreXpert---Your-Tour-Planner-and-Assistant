import 'package:flutter/material.dart';

import '../../../../user_auth/presentation/pages/auth_via_page.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40,
        right: 10,
        child: TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthViaPage()),
                  (route) => false);
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  color: Colors.black),
            )));
  }
}
