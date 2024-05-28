import 'package:explorexpert/features/app/pages/profile/profile_edit.dart';
import 'package:explorexpert/features/app/pages/profile/widgets/profile_menu.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileManagement extends StatefulWidget {
  const ProfileManagement({super.key});

  @override
  State<ProfileManagement> createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagement> {
  final String name = 'Taha Ahmad';

  final String email = 'taha@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage('assets/images/userprofile1.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: EXColors.primaryLight,
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit,
                                size: 20.0, color: EXColors.primaryDark)),
                      ),
                    ),
                  ],
                ),
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  email,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: Divider(),
                ),
                ProfileMenu(
                  title: 'Personal Info',
                  icon: Icons.settings,
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                ),
                ProfileMenu(
                  title: 'Billing Details',
                  icon: Icons.wallet,
                  onPress: () {},
                ),
                ProfileMenu(
                  title: 'User Management',
                  icon: Icons.person_sharp,
                  onPress: () {},
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Divider(),
                ),
                ProfileMenu(
                  title: 'Information',
                  icon: Icons.info,
                  onPress: () {},
                ),
                ProfileMenu(
                  title: 'Logout',
                  icon: Icons.logout,
                  endIcon: false,
                  textColor: Colors.red,
                  onPress: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}