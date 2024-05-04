import 'package:flutter/material.dart';

import '../../../user_auth/presentation/widgets/essentials.dart';

class GlobePage extends StatefulWidget {
  const GlobePage({super.key});

  @override
  State<GlobePage> createState() => _GlobePageState();
}

class _GlobePageState extends State<GlobePage> {
  bool isLiked = false;
  bool isSaved = false;
  int likeCount = 59;
  int commentCount = 420;
  List name = ['Taha Ahmad', 'Muhammad Taha', 'Goheer59ya'];
  List profile = [
    'assets/images/userprofile2.JPEG',
    'assets/images/userprofile1.png',
    'assets/images/userprofile3.png',
  ];
  List postimage = [
    'assets/images/post_1.png',
    'assets/images/post_2.png',
    'assets/images/post_1.png'
  ];
  List caption = [
    'Nice Place to Enjoy and Chill.',
    'Great to spend Vacations',
    'Some meetings are nice, at good spots'
  ];
  List tags = ['#resorts #chill', '#snowfall #enjoy', '#meet #nice'];
  Map<String, List<String>> location = {
    'city': ['Skardu', 'Quetta', 'Muzaffarbad'],
    'province': ['Gilgit-Baltistan', 'Balochistan', 'Azad Kahmir']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/ExploreXpertTitleAppBar.png',
          height: 25,
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
      body: ListView.builder(
        itemCount: caption.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          foregroundDecoration:
              BoxDecoration(border: Border.all(color: EXColors.primaryDark)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_sharp,
                          color: EXColors.primaryDark,
                          size: 30,
                        ),
                        Text(
                          '${location['city']![index]}, ${location['province']![index]}',
                          style: const TextStyle(
                              fontSize: 14, color: EXColors.primaryDark),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            name[index],
                            style: const TextStyle(
                                fontSize: 14, color: EXColors.secondaryDark),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: CircleAvatar(
                            foregroundImage: AssetImage(profile[index]),
                            radius: 20,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 270,
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(postimage[index]), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                setState(() {
                                  if (isLiked == false) {
                                    isLiked = !isLiked;
                                    likeCount += 1;
                                  } else {
                                    isLiked = !isLiked;
                                    likeCount -= 1;
                                  }
                                });
                              },
                              icon: isLiked == true
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(Icons.favorite_border),
                            ),
                            Text('$likeCount')
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: const Icon(Icons.comment_rounded),
                            ),
                            Text('$commentCount')
                          ],
                        )
                      ],
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          if (isSaved == false) {
                            isSaved = !isSaved;
                          } else {
                            isSaved = !isSaved;
                          }
                        });
                      },
                      icon: isSaved == true
                          ? const Icon(
                              Icons.bookmark,
                              color: EXColors.primaryDark,
                            )
                          : const Icon(
                              Icons.bookmark_border,
                            ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      caption[index],
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(tags[index])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
