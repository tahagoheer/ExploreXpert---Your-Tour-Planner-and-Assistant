import 'package:flutter/material.dart';

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
          icon: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/userprofile1.png'),
            radius: 25,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
