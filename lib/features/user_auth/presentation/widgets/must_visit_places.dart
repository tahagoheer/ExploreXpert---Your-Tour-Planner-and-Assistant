import 'package:flutter/material.dart';

class MustVisitPlaces extends StatelessWidget {
  final String? thumbnailpath;
  final String? title;
  final double rating;
  const MustVisitPlaces({
    super.key,
    this.thumbnailpath,
    this.title,
    required this.rating,
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
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("$thumbnailpath")),
          ),
        ),
        Positioned(
          left: 6,
          right: 10,
          bottom: 10,
          child: Text(
            '$title',
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
                  '$rating',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
