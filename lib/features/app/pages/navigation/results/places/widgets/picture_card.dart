import 'package:flutter/material.dart';

class PictureCard extends StatelessWidget {
  final String? thumbnailpath;
  final String? title;
  const PictureCard({
    super.key,
    this.thumbnailpath,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            height: 90,
            width: 113.5,
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
              title ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
