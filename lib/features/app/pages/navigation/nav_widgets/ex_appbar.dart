import 'package:flutter/material.dart';

import '../../../../user_auth/presentation/widgets/essentials.dart';
import '../../profile/profile_management_home.dart';

class EXAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EXAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Image.asset(
        'assets/images/ExploreXpertTitleAppBar.png',
        height: 25,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileManagement()));
          },
          icon: Container(
            width: 25 * 2 + 5 * 2,
            height: 25 * 2 + 5 * 2,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: EXColors.primaryDark, // The color of the ring
            ),
            child: const Padding(
              padding: EdgeInsets.all(3),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/userprofile1.png'),
                radius: 25,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
