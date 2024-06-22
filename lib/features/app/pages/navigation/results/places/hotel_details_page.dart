import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/app/pages/navigation/results/places/rooms_by_providers.dart';
import 'package:explorexpert/features/app/pages/navigation/results/places/widgets/picture_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../global/utilities/capitalize_first_letter.dart';
import '../../../../../repos/fetch_data/get_room_details.dart';
import '../../../../../user_auth/presentation/widgets/essentials.dart';

class HotelDetailsPage extends StatefulWidget {
  final String hotelId;
  const HotelDetailsPage({super.key, required this.hotelId});

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  final FireStoreService firestoreService = FireStoreService();
  void showBottomSheet() {
    showModalBottomSheet(
      showDragHandle: true,
      barrierColor: Colors.white24,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FutureBuilder<DocumentSnapshot>(
          future: firestoreService.getHotelDetails(widget.hotelId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Center(child: CircularProgressIndicator()));
            }
            var hotelData = snapshot.data!.data() as Map<String, dynamic>;

            return DraggableScrollableSheet(
                expand: false,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return ListView(
                    controller: scrollController,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: const BoxDecoration(
                          color: EXColors.primaryLight,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          capitalizeFirstLetter(
                                              hotelData['name']),
                                          style: const TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.pin_drop,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              '${capitalizeFirstLetter(hotelData['city'])}, Pakistan',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          '${hotelData['ratings']}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25.0),
                                child: Text(
                                  hotelData['description'],
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              const Row(
                                children: [
                                  PictureCard(
                                    thumbnailpath: 'assets/images/city1.png',
                                  ),
                                  PictureCard(
                                    thumbnailpath: 'assets/images/city2.png',
                                  ),
                                  PictureCard(
                                    thumbnailpath: 'assets/images/city3.png',
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 10,
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RoomsByProviderPage(
                                                      hotelData['name'])));
                                    },
                                    color: EXColors.specialDark,
                                    height: 50,
                                    mouseCursor:
                                        WidgetStateMouseCursor.clickable,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Book Room',
                                          style: TextStyle(
                                              color: EXColors.secondaryLight,
                                              fontSize: 22,
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.arrow_circle_right_rounded,
                                          color: EXColors.specialLight,
                                          size: 35,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/multan-gif.gif'),
            fit: BoxFit.cover,
            opacity: 0.7),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.white, blurRadius: 6)
                        ]),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28,
                    ),
                  ),
                ),
                InkWell(
                  onTap: showBottomSheet,
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.white, blurRadius: 6)
                        ]),
                    child: const Icon(
                      Icons.info,
                      size: 28,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              // Upward drag detected
              showBottomSheet();
            }
          },
        ),
        bottomNavigationBar: FutureBuilder<DocumentSnapshot>(
          future: firestoreService.getHotelDetails(widget.hotelId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Center(child: CircularProgressIndicator()));
            }
            var hotelData = snapshot.data!.data() as Map<String, dynamic>;

            return GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  // Upward drag detected
                  showBottomSheet();
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(15)),
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45, blurRadius: 10)
                                ]),
                                child: const Icon(
                                  FontAwesomeIcons.hotel,
                                  color: Colors.amber,
                                  size: 30,
                                ),
                              ),
                            ),
                            Text(
                              capitalizeFirstLetter(hotelData['name']),
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Container(
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45, blurRadius: 10)
                                ]),
                                child: const Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                            ),
                            Text(
                              '${capitalizeFirstLetter(hotelData['city'])}, Pakistan',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Container(
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45, blurRadius: 10)
                                ]),
                                child: const Icon(
                                  Icons.hotel_class,
                                  color: EXColors.primaryDark,
                                  size: 40,
                                ),
                              ),
                            ),
                            Text(
                              '${capitalizeFirstLetter(hotelData['type'])} Hotel',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Container(
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45, blurRadius: 10)
                                ]),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 40,
                                ),
                              ),
                            ),
                            Text(
                              '${hotelData['ratings']} Ratings',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
