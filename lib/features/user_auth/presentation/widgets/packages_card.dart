import 'package:flutter/material.dart';

import 'essentials.dart';

class PackagesCard extends StatelessWidget {
  final String? thumbnailpath;
  final String? title;
  final double rating;
  final String? label;
  final int days;
  final int nights;
  final String? currency;
  final int price;
  const PackagesCard({
    super.key,
    this.thumbnailpath,
    this.title,
    required this.rating,
    required this.days,
    required this.nights,
    this.label,
    this.currency,
    required this.price,
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$label • ${days}D ${nights}N',
                style: const TextStyle(
                  color: EXColors.primaryDark,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$title',
                style: const TextStyle(
                  color: EXColors.activeText,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '$currency $price',
                    style: const TextStyle(
                      color: EXColors.primaryDark,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'onwards',
                    style: TextStyle(
                      color: EXColors.disabledText,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
