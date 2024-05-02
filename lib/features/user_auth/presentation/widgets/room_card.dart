import 'package:explorexpert/features/user_auth/presentation/pages/room_details_page.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String? title;
  final int? price;
  final int? discount;
  final String? thumbnailpath;
  final String? currency;
  final String? timespan;
  final String? provider;
  const RoomCard({
    super.key,
    this.title,
    this.price,
    this.discount,
    this.thumbnailpath,
    this.currency = 'PKR',
    this.timespan,
    this.provider = 'ExloreXpert',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 10,
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
                      '$currency $price/$timespan'.toUpperCase(),
                      style: const TextStyle(
                          color: EXColors.activeText,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text(
                      '$discount',
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
                            builder: (context) => const RoomDetailsPage()));
                  },
                  color: EXColors.specialDark,
                  height: 25,
                  mouseCursor: MaterialStateMouseCursor.clickable,
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
    );
  }
}
