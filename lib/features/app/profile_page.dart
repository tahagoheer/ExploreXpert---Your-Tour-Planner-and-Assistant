import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../user_auth/presentation/widgets/essentials.dart';

class ProfilePage extends StatelessWidget {
  final String? username = 'Goheer59ya';
  final String coverphoto = 'assets/images/profilecover.png';
  final String profilepicture = 'assets/images/userprofile3.png';
  final String name = 'Taha Ahmad';
  final String address = 'Hasilpur, Pakistan';
  final int travellies = 150;
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '$username',
          style: const TextStyle(
              color: EXColors.primaryDark, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/userprofile1.png'),
              radius: 25,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 280,
            child: Stack(
              children: [
                Container(
                  height: 160,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(coverphoto),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: Row(
                      children: [
                        CircleAvatar(
                          foregroundImage: AssetImage(profilepicture),
                          radius: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$name',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              address,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              '$travellies travellies',
                              style: TextStyle(
                                  color: EXColors.primaryDark,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
