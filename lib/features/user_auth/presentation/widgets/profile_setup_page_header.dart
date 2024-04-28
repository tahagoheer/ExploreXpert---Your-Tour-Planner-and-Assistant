import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';

class ProfileSetupHeader extends StatelessWidget {
  const ProfileSetupHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ExploreXpertLogoBlack.png'),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 207,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ExploreXpertTitleBlack.png'),
            ),
          ),
        ),
      ],
    );
  }
}
