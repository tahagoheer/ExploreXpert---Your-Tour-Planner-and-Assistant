import 'package:explorexpert/features/app/pages/onboarding/widgets/next_button.dart';
import 'package:explorexpert/features/app/pages/onboarding/widgets/onboarding_dot_navigator.dart';
import 'package:explorexpert/features/app/pages/onboarding/widgets/onboarding_page.dart';
import 'package:explorexpert/features/app/pages/onboarding/widgets/skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int currentPageIndex = 0;
  IconData nbi = Icons.navigate_next_rounded;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              currentPageIndex = index;
              if (index == 2) {
                nbi = Icons.done_rounded;
              } else {
                nbi = Icons.navigate_next_rounded;
              }

              setState(() {});
            },
            controller: controller,
            children: const [
              OnBoardingPage(
                title: 'Explore Your\nInterests',
                image: 'assets/images/OB1.png',
              ),
              OnBoardingPage(
                title: 'Plan Your\nBusiness Tour',
                image: 'assets/images/OB2.png',
              ),
              OnBoardingPage(
                title: 'Plan Your\nTrip',
                image: 'assets/images/OB3.png',
              ),
            ],
          ),
          const SkipButton(),
          OnBoardingDotNavigator(controller: controller),
          NextButton(
              currentPageIndex: currentPageIndex,
              controller: controller,
              nbi: nbi),
        ],
      ),
    );
  }
}
