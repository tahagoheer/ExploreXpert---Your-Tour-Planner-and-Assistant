import 'package:flutter/material.dart';

class PlacesCard extends StatelessWidget {
  final String? thumbnailpath;
  final String? title;
  const PlacesCard({
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
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(right: 10),
          height: 100,
          width: 125,
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
    );
  }
}
