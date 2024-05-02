import 'package:flutter/material.dart';

class TravelThemeCard extends StatelessWidget {
  final String? thumbnailpath;
  final String? title;
  const TravelThemeCard({
    super.key,
    this.thumbnailpath,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(right: 10),
          height: 160,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("$thumbnailpath")),
          ),
        ),
        Positioned(
          left: 8,
          top: 90,
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
    );
  }
}
