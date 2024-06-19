import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';

import '../../../app/pages/navigation/results/places/hotel_details_page.dart';

class HotelCard extends StatelessWidget {
  final String? name;
  final String? city;
  final String? thumbnailpath;
  final String hotelId;
  const HotelCard({
    super.key,
    this.name,
    this.city,
    this.thumbnailpath,
    required this.hotelId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 10,
        child: Card(
          color: EXColors.secondaryLight,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180,
                  width: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("$thumbnailpath"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    '$name',
                    style: const TextStyle(
                        color: EXColors.mainText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '$city',
                    style:
                        const TextStyle(color: EXColors.mainText, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HotelDetailsPage()));
      },
    );
  }
}
