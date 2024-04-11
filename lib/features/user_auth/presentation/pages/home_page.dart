import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/essentials.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          const Text('Welcome Home 🙃'),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.50,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              color: EXColors.warning,
              height: 60,
              mouseCursor: MaterialStateMouseCursor.clickable,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
