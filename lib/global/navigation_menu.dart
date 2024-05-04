import 'package:explorexpert/features/app/pages/chat_page.dart';
import 'package:explorexpert/features/app/pages/globe_page.dart';
import 'package:explorexpert/features/app/pages/home_page.dart';
import 'package:explorexpert/features/app/pages/profile_page.dart';
import 'package:explorexpert/features/app/pages/search_page.dart';
import 'package:flutter/material.dart';

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
