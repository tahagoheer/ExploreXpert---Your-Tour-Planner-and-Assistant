import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/essentials.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _user != null
          ? Column(
              children: [
                const Text('Welcome Home 🙃'),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_user!.photoURL!),
                    ),
                  ),
                ),
                Text(_user!.email!),
                Text(_user!.displayName ?? ""),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: MaterialButton(
                    onPressed: _auth.signOut,
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
            )
          : const Column(
              children: [
                Text('Welcome Home 🙃 \n You\'re not signed in 😒'),
              ],
            ),
    );
  }
}
