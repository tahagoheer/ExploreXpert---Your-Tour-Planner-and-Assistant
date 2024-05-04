import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../user_auth/presentation/widgets/essentials.dart';

class OnBoardingDotNavigator extends StatelessWidget {
  const OnBoardingDotNavigator({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: MediaQuery.of(context).size.width / 2 - 60,
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: CustomizableEffect(
          activeDotDecoration: DotDecoration(
            width: 18,
            height: 18,
            color: EXColors.primaryDark,
            rotationAngle: 45,
            borderRadius: BorderRadius.circular(6),
            dotBorder: const DotBorder(
              padding: 2,
              width: 2,
              color: EXColors.primaryDark,
            ),
          ),
          dotDecoration: DotDecoration(
            width: 16,
            height: 16,
            color: EXColors.transparent,
            dotBorder: const DotBorder(
              padding: 2,
              width: 2,
              color: EXColors.primaryDark,
            ),
            borderRadius: BorderRadius.circular(5),
            // borderRadius: BorderRadius.circular(16),
            verticalOffset: 0,
          ),
          spacing: 10.0,
        ),
      ),
    );
  }
}
