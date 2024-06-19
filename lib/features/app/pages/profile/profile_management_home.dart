import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/app/pages/profile/profile_edit_page.dart';
import 'package:explorexpert/features/app/pages/profile/widgets/profile_menu.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../global/toast.dart';
import '../../../../global/utilities/current_user_details.dart';
import 'package:explorexpert/features/repos/fetch_data/get_users.dart';

import '../../../user_auth/presentation/pages/login_page.dart';

class ProfileManagement extends StatefulWidget {
  const ProfileManagement({super.key});

  @override
  State<ProfileManagement> createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagement> {
  final FireStoreService firestoreService = FireStoreService();
  var auth = FirebaseAuth.instance;

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
                FutureBuilder<DocumentSnapshot>(
                    future: firestoreService
                        .getCurrentUserStream(EXCurrentUser.email),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(
                            height: 100 * 2 + 5 * 2,
                            child: Center(child: CircularProgressIndicator()));
                      }
                      var currentUser =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 120,
                                child: Container(
                                  width: 100 * 2 + 5 * 2,
                                  height: 100 * 2 + 5 * 2,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: EXColors
                                        .primaryDark, // The color of the ring
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: (currentUser['profilepic'] == null)
                                          ? const Icon(
                                              FontAwesomeIcons.solidCircleUser,
                                              size: 100,
                                            )
                                          : Image(
                                              image: NetworkImage(
                                                  currentUser['profilepic']),
                                              fit: BoxFit.cover,
                                            ),
                                    ),
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
                                      icon: const Icon(Icons.edit,
                                          size: 20.0,
                                          color: EXColors.primaryDark)),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            currentUser['name'].toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            currentUser['email'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      );
                    }),
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: Divider(),
                ),
                ProfileMenu(
                  title: 'Personal Info',
                  icon: Icons.settings,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  },
                ),
                ProfileMenu(
                  title: 'Billing Details',
                  icon: Icons.wallet,
                  onPress: () {},
                ),
                ProfileMenu(
                  title: 'Travel History',
                  icon: Icons.history,
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
                  onPress: () async {
                    await auth.signOut();
                    showToast(message: 'Logged Out');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
