import 'package:flutter/material.dart';

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
          onPressed: () {},
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
