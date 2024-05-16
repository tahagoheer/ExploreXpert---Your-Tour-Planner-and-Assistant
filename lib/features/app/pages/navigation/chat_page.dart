import 'package:flutter/material.dart';

import 'nav_widgets/ex_appbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EXAppBar(),
      body: Center(
          child: Text(
        'No notifications yet \n🙃🔕❤️‍🩹',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      )),
    );
  }
}
