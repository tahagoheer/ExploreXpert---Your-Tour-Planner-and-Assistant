import 'package:explorexpert/features/user_auth/presentation/pages/room_details_page.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:explorexpert/global/utilities/capitalize_first_letter.dart';
import 'package:flutter/material.dart';

import '../../../../global/utilities/price_in_k.dart';

class RoomCardHorizontal extends StatelessWidget {
  final String? title;
  final int? discountedPrice;
  final int? originalPrice;
  final String? thumbnailpath;
  final String? currency;
  final String? timespan;
  final String? provider;
  final String roomId;
  const RoomCardHorizontal({
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
      width: MediaQuery.of(context).size.width - 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RoomDetailsPage(roomId)));
        },
        child: Card(
          color: EXColors.secondaryLight,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("$thumbnailpath"),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                capitalizeFirstLetter(title!),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: const TextStyle(
                                    color: EXColors.mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                capitalizeFirstLetter(provider!),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: EXColors.mainText, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              priceInK(discountedPrice!),
                              style: const TextStyle(
                                  color: EXColors.activeText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Text(
                              'per $timespan'.toUpperCase(),
                              style: const TextStyle(
                                  color: EXColors.activeText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8),
                            ),
                            Text(
                              priceInK(originalPrice!),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
