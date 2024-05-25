import 'package:explorexpert/features/app/pages/navigation/chat_page.dart';
import 'package:explorexpert/features/app/pages/navigation/globe_page.dart';
import 'package:explorexpert/features/app/pages/navigation/home_page.dart';
import 'package:explorexpert/features/app/pages/navigation/nav_widgets/ex_appbar.dart';
import 'package:explorexpert/features/app/pages/navigation/profile_page.dart';
import 'package:explorexpert/features/app/pages/navigation/search_page.dart';
import 'package:explorexpert/features/user_auth/presentation/pages/login_page.dart';
import 'package:explorexpert/global/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../features/user_auth/presentation/widgets/essentials.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPage = 0;
  var auth = FirebaseAuth.instance;
  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const GlobePage(),
    const ChatPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
                onPressed: () {
                  setState(() {
                    auth.signOut();
                    showToast(message: 'Logged Out');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false);
                  });
                },
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
      ),
      appBar: const EXAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
        backgroundColor: EXColors.primaryDark,
        selectedItemColor: EXColors.primaryDark,
        unselectedItemColor: Colors.black,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '•',
              activeIcon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: '•',
              activeIcon: Icon(Icons.search)),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage('assets/images/ExploreXpertIconSecondary.png')),
            label: '•',
            activeIcon: ImageIcon(
                AssetImage('assets/images/ExploreXpertIconSecondary.png')),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined),
              label: '•',
              activeIcon: Icon(Icons.notifications_active_rounded)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: '•',
              activeIcon: Icon(Icons.person_2)),
        ],
      ),
      body: pages[currentPage],
    );
  }
}
