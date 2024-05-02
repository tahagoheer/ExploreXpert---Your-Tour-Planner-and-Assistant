import 'package:explorexpert/features/user_auth/presentation/widgets/badges_grid.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/destinations_grid.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/posts_grid.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/visited_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../user_auth/presentation/widgets/essentials.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String? username = 'Goheer59ya';

  final String coverphoto = 'assets/images/profilecover.png';

  final String profilepicture = 'assets/images/userprofile3.png';

  final String name = 'Taha Ahmad';

  final String address = 'Hasilpur, Pakistan';

  final int travellies = 150;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              foregroundImage: AssetImage(profilepicture),
                              radius: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$name',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    address,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    '$travellies travellies',
                                    style: const TextStyle(
                                        color: EXColors.primaryDark,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.penToSquare),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const TabBar(
              labelColor: EXColors.primaryDark,
              dividerColor: EXColors.primaryDark,
              indicatorColor: EXColors.primaryDark,
              tabs: [
                Tab(
                  child: Text('Posts'),
                ),
                Tab(
                  child: Text('Badges'),
                ),
                Tab(
                  child: Text('Visited'),
                ),
                Tab(
                  child: Text(
                    'Destinations',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: PostsGrid(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: BadgesGrid(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: VisitedGrid(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: DestinationsGrid(),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
