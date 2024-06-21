import 'package:explorexpert/features/user_auth/presentation/pages/room_details_page.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';

import '../../../../global/utilities/price_in_k.dart';

class RoomCard extends StatelessWidget {
  final String? title;
  final int? discountedPrice;
  final int? originalPrice;
  final String? thumbnailpath;
  final String? currency;
  final String? timespan;
  final String? provider;
  final String roomId;
  const RoomCard({
    super.key,
    this.title,
    this.discountedPrice,
    this.originalPrice,
    this.thumbnailpath,
    this.currency = 'PKR',
    this.timespan,
    this.provider = 'ExloreXpert',
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 10,
      child: GestureDetector(
        child: Card(
          color: EXColors.secondaryLight,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("$thumbnailpath"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    '$title',
                    style: const TextStyle(
                        color: EXColors.mainText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '$provider',
                    style:
                        const TextStyle(color: EXColors.mainText, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '$currency ${priceInK(discountedPrice!)}/$timespan'
                            .toUpperCase(),
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            color: EXColors.activeText,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        '$originalPrice',
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: EXColors.secondaryDark,
                            decorationThickness: 1,
                            color: EXColors.disabledText,
                            fontSize: 11),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RoomDetailsPage(roomId)));
                    },
                    color: EXColors.specialDark,
                    height: 25,
                    mouseCursor: WidgetStateMouseCursor.clickable,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Book Now',
                          style: TextStyle(
                              color: EXColors.secondaryLight,
                              fontSize: 12,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_circle_right_rounded,
                          color: EXColors.specialLight,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RoomDetailsPage(roomId)));
        },
      ),
    );
  }
}
