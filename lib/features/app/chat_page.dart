import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      ),
      body: Center(
          child: Text(
        'No notifications yet \n🙃🔕❤️‍🩹',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      )),
    );
  }
}
