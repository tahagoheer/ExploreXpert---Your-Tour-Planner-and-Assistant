import 'package:explorexpert/features/app/chat_page.dart';
import 'package:explorexpert/features/app/globe_page.dart';
import 'package:explorexpert/features/app/home_page.dart';
import 'package:explorexpert/features/app/profile_page.dart';
import 'package:explorexpert/features/app/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../features/user_auth/presentation/widgets/essentials.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPage = 0;
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
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
              label: 'Home',
              activeIcon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Seearch',
              activeIcon: Icon(Icons.search)),
          BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore_outlined),
              label: 'Globe',
              activeIcon: Icon(Icons.travel_explore)),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              label: 'Chat',
              activeIcon: Icon(Icons.chat)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
              activeIcon: Icon(Icons.person_2)),
        ],
      ),
      body: pages[currentPage],
    );
  }
}
