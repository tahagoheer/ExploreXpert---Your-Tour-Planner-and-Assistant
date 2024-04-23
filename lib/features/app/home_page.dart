import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          child: Image.asset(
            "assets/images/ExploreXpertLogo.png",
            height: 50,
            width: 50,
          ),
        ),
        title: const Image(
          image: AssetImage(
            "assets/images/ExploreXpertTitleAppBar.png",
          ),
          height: 30,
        ),
      ),
      body: const SizedBox(
        height: 100,
      ),
    );
  }
}
