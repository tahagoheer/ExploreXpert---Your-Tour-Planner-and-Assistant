import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../global/utilities/current_user_details.dart';
import '../../../../repos/fetch_data/get_users.dart';
import '../../../../user_auth/presentation/widgets/essentials.dart';
import '../../profile/profile_management_home.dart';

class EXAppBar extends StatelessWidget implements PreferredSizeWidget {
  EXAppBar({
    super.key,
  });
  final FireStoreService firestoreService = FireStoreService();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Image.asset(
        'assets/images/ExploreXpertTitleAppBar.png',
        height: 25,
      ),
      actions: [
        FutureBuilder<DocumentSnapshot>(
            future: firestoreService.getCurrentUserStream(EXCurrentUser.email),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox(
                    height: 25 * 2 + 5 * 2,
                    child: Center(child: CircularProgressIndicator()));
              }
              var currentUser = snapshot.data!.data() as Map<String, dynamic>;
              return IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileManagement()));
                },
                icon: Container(
                  width: 40,
                  height: 25 * 2 + 5 * 2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: EXColors.primaryDark, // The color of the ring
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: (currentUser['profilepic'] == null)
                          ? const Icon(
                              FontAwesomeIcons.solidCircleUser,
                              size: 100,
                            )
                          : Image(
                              image: NetworkImage(currentUser['profilepic']),
                              fit: BoxFit.cover,
                              height: 25 * 2 + 5 * 2,
                              width: 25 * 2 + 5 * 2,
                            ),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
