import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../global/toast.dart';
import '../../../../user_auth/presentation/pages/login_page.dart';
import '../../../../user_auth/presentation/widgets/essentials.dart';
import '../search_page.dart';

class EXDrawer extends StatefulWidget {
  const EXDrawer({
    super.key,
  });

  @override
  State<EXDrawer> createState() => _EXDrawerState();
}

class _EXDrawerState extends State<EXDrawer> {
  var auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: EXColors.primaryLight,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage(
                          'assets/images/ExploreXpertLogoPrimary.png',
                        ),
                        height: 120,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Calender'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.checklist),
              title: const Text('Itinerary Planner'),
              onTap: () {},
            ),
            ListTile(
              splashColor: Colors.red,
              leading: const Icon(Icons.local_taxi),
              title: const Text('Book Taxi'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ));
              },
            ),
            MaterialButton(
              onPressed: _signOut,
              child: const Row(children: [
                Icon(Icons.logout),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('Logout'),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  void _signOut() async {
    await auth.signOut();
    _onSignOutComplete();
  }

  void _onSignOutComplete() {
    showToast(message: 'Logged Out');
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (route) => false,
      );
    }
  }
}
