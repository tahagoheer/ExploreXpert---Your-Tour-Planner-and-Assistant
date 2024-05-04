import 'package:flutter/material.dart';

import '../../../../user_auth/presentation/pages/auth_via_page.dart';
import '../../../../user_auth/presentation/widgets/essentials.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.currentPageIndex,
    required this.controller,
    required this.nbi,
  });

  final int currentPageIndex;
  final PageController controller;
  final IconData nbi;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 105,
      right: 40,
      child: Container(
        height: 70,
        width: 70,
        foregroundDecoration: BoxDecoration(
          border: Border.all(
              color: Colors.blueGrey, width: 8, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15),
        ),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blueGrey, width: 8, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15),
        ),
        child: MaterialButton(
          color: EXColors.primaryDark,
          onPressed: () {
            if (currentPageIndex == 2) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthViaPage()),
                  (route) => false);
            } else {
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
          },
          child: Icon(
            nbi,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
