import 'package:explorexpert/features/app/pages/navigation/results/places/places_page.dart';
import 'package:flutter/material.dart';

class PlacesCard extends StatelessWidget {
  final String? thumbnailpath;
  final String? title;
  final String querycity;
  const PlacesCard({
    super.key,
    this.thumbnailpath,
    this.title,
    required this.querycity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            foregroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(right: 10),
            height: 100,
            width: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("$thumbnailpath")),
            ),
          ),
          Positioned(
            left: 5,
            top: 65,
            child: Text(
              '$title',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlacesPage(querycity)));
      },
    );
  }
}
