import 'package:flutter/material.dart';

class DestinationsGrid extends StatelessWidget {
  final thumbnailpaths = [
    'assets/images/DG1.png',
    'assets/images/DG2.png',
    'assets/images/DG3.png',
    'assets/images/DG4.png',
  ];
  final titles = [
    'Lahore',
    'Karachi',
    'Faisalabad',
    'Islamabad',
  ];
  DestinationsGrid({super.key});

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
              color: Colors.black.withOpacity(0.2),
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
        ],
      ),
    );
  }
}
