import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/badges_grid.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/destinations_grid.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/posts_grid.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/visited_grid.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../global/utilities/current_user_details.dart';
import '../../../repos/fetch_data/get_users.dart';
import '../../../user_auth/presentation/widgets/essentials.dart';
import '../profile/profile_edit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FireStoreService firestoreService = FireStoreService();

  final String coverphoto = 'assets/images/profilecover.png';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
            future: firestoreService.getCurrentUserStream(EXCurrentUser.email),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: const Center(child: CircularProgressIndicator()));
              }
              var currentUser = snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                  SizedBox(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
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
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 80,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: (currentUser['profilepic'] ==
                                                null)
                                            ? const Icon(
                                                FontAwesomeIcons
                                                    .solidCircleUser,
                                                size: 100,
                                              )
                                            : Image(
                                                image: NetworkImage(
                                                    currentUser['profilepic']),
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                170,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              currentUser['name'],
                                              softWrap: true,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  170,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${currentUser['travellies']} travellies',
                                                        style: const TextStyle(
                                                            color: EXColors
                                                                .primaryDark,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        '${currentUser['city']}, ${currentUser['country']}',
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20.0),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const EditProfile()));
                                                      },
                                                      icon: const Icon(
                                                          FontAwesomeIcons
                                                              .penToSquare),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: PostsGrid(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: BadgesGrid(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: VisitedGrid(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: DestinationsGrid(),
                          ),
                        ]),
                  )
                ],
              );
            }),
      ),
    );
  }
}
