import 'package:flutter/material.dart';

class VisitedGrid extends StatelessWidget {
  final thumbnailpaths = [
    'assets/images/MVP1.png',
    'assets/images/MVP2.png',
    'assets/images/MVP3.png',
    'assets/images/MVP4.png',
  ];
  final titles = [
    'Multan',
    'Lahore',
    'Islamabad',
    'Vehari',
  ];
  final ratings = [3.9, 4.1, 4.7, 3.2];
  VisitedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3.0,
        childAspectRatio: (3 / 4),
        crossAxisSpacing: 3.0,
      ),
      itemBuilder: (context, index) => Stack(
        children: [
          Container(
            alignment: Alignment.center,
            foregroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(right: 10),
            height: 170,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(thumbnailpaths[index])),
            ),
          ),
          Positioned(
            left: 8,
            top: 130,
            child: Text(
              titles[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              height: 25,
              width: 54,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.black54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  Text(
                    '${ratings[index]}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
