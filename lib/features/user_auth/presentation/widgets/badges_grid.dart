import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BadgesGrid extends StatefulWidget {
  const BadgesGrid({super.key});

  @override
  State<BadgesGrid> createState() => _BadgesGridState();
}

class _BadgesGridState extends State<BadgesGrid> {
  final badgetitles = [
    'Badges Earned',
    'Travel Streak',
    'Swimmer of the week',
    'Trekker of the week',
  ];

  final List<Color> badgetilecolor = [
    const Color(0xFFFFE7E7),
    const Color(0xFFFBF3CA),
    const Color(0xFFE6EEFE),
    const Color(0xFFFFE7FE),
  ];
  final List<Color> badgeiconcolor = [
    const Color(0xFFAB94EC),
    const Color(0xFFD08686),
    const Color(0xFF4AA9BC),
    const Color(0xFFBD9157),
  ];
  final List<IconData> badgeicons = [
    Icons.shield,
    Icons.local_fire_department_outlined,
    FontAwesomeIcons.personSwimming,
    FontAwesomeIcons.personHiking
  ];

  final badgescount = [7, 15, 2, 1];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: (3 / 4),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) => Container(
        height: 200,
        decoration: BoxDecoration(
            color: badgetilecolor[index],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              badgeicons[index],
              color: badgeiconcolor[index],
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                badgetitles[index],
                textAlign: TextAlign.center,
              ),
            ),
            Text('${badgescount[index]}')
          ],
        ),
      ),
    );
  }
}
