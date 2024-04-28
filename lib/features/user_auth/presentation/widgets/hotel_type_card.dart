import 'package:flutter/material.dart';

class HotelTypeCard extends StatelessWidget {
  final String? thumbnailpath;
  final int? type;

  const HotelTypeCard({
    super.key,
    this.thumbnailpath,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          image: DecorationImage(image: AssetImage('$thumbnailpath'))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 120,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: type == 5
                  ? Colors.amber
                  : type == 4
                      ? Colors.blue
                      : Colors.red,
            ),
            child: Center(
              child: Text(
                '$type Star Hotel',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
