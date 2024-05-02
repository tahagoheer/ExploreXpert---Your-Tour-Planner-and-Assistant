import 'package:flutter/material.dart';

import 'essentials.dart';

class PaymentsProviderCard extends StatelessWidget {
  final String thumbnailpath;
  PaymentsProviderCard({
    super.key,
    required this.thumbnailpath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 90,
      foregroundDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: EXColors.primaryDark),
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(thumbnailpath))),
    );
  }
}
