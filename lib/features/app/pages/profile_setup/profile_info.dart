import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation/nav_widgets/ex_appbar.dart';
import '../navigation/nav_widgets/ex_drawer.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: EXDrawer(),
      appBar: EXAppBar(),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.menu_book_rounded,
              color: EXColors.primaryDark,
            ),
            Text('Tell us about you !'),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}
