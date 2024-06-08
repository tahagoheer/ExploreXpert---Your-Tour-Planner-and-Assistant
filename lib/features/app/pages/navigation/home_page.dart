import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/app/pages/navigation/results/places/places_page.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/room_card.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/room_card_horizontal.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../user_auth/presentation/utilities/get_rooms.dart';
import '../../../user_auth/presentation/widgets/hotel_type_card.dart';
import '../../../user_auth/presentation/widgets/places_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FireStoreService firestoreService = FireStoreService();
  final thumbnailpaths = [
    'assets/images/allroom2.png',
    'assets/images/allroom1.png',
    'assets/images/allroom1.png',
    'assets/images/allroom2.png',
    'assets/images/allroom2.png',
    'assets/images/allroom1.png',
    'assets/images/allroom1.png',
    'assets/images/allroom2.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                text: 'Places',
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PlacesCard(
                      thumbnailpath: 'assets/images/allHotel1.png',
                      title: 'Islamabad',
                      query_city: 'islamabad',
                    ),
                    PlacesCard(
                      thumbnailpath: 'assets/images/allHotel2.png',
                      title: 'Lahore',
                      query_city: 'lahore',
                    ),
                    PlacesCard(
                      thumbnailpath: 'assets/images/allHotel3.png',
                      title: 'Multan',
                      query_city: 'multan',
                    ),
                    PlacesCard(
                      thumbnailpath: 'assets/images/allHotel4.png',
                      title: 'Faisalabad',
                      query_city: 'faisalabad',
                    ),
                  ],
                ),
              ),
              const SectionHeading(
                text: 'Hotel Types',
              ),
              const SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HotelTypeCard(
                      thumbnailpath: 'assets/images/5star.png',
                      type: 5,
                    ),
                    HotelTypeCard(
                      thumbnailpath: 'assets/images/4star.png',
                      type: 4,
                    ),
                    HotelTypeCard(
                      thumbnailpath: 'assets/images/3star.png',
                      type: 3,
                    )
                  ],
                ),
              ),
              const SectionHeading(
                text: 'Top Rated Rooms',
              ),
              StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getRoomsStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child:
                            const Center(child: CircularProgressIndicator()));
                  }
                  List roomsList = snapshot.data!.docs;
                  return GridView.builder(
                      itemCount: roomsList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 4.0,
                        mainAxisExtent: 260,
                      ),
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = roomsList[index];
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String documentId = document.id;
                        String roomTitle = data['title'];
                        String roomProvider = data['provider'];
                        int roomDiscountedPrice =
                            (data['rent'] - data['discount']);
                        int roomOriginalPrice = data['rent'];
                        String roomTimespan = data['timespan'];
                        return RoomCard(
                          thumbnailpath: thumbnailpaths[index],
                          title: roomTitle,
                          provider: roomProvider,
                          discountedPrice: roomDiscountedPrice,
                          timespan: roomTimespan,
                          originalPrice: roomOriginalPrice,
                          roomId: documentId,
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
