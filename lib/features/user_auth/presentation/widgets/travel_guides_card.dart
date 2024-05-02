import 'package:flutter/material.dart';

class TravelGuidesCard extends StatelessWidget {
  final String? thumbnailpath;
  final String? title;

  const TravelGuidesCard({
    super.key,
    this.thumbnailpath,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.only(right: 10),
              height: 120,
              width: 185,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage("$thumbnailpath")),
              ),
            ),
            Positioned(
              left: 8,
              top: 80,
              child: Text(
                '$title',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
