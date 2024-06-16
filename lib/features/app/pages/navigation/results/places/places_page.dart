import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/app/pages/navigation/nav_widgets/ex_appbar.dart';
import 'package:explorexpert/features/repos/fetch_data/get_places.dart';
import 'package:flutter/material.dart';

import '../../../../../user_auth/presentation/widgets/hotel_card.dart';
import '../../../../../user_auth/presentation/widgets/room_card_horizontal.dart';
import '../../../../../user_auth/presentation/widgets/section_heading.dart';
import '../../../../../../global/utilities/camel_case_text.dart';

class PlacesPage extends StatefulWidget {
  final String queryCity;
  const PlacesPage(
    this.queryCity, {
    super.key,
  });

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
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
      appBar: const EXAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeading(
                text: 'Hotels In ${capitalizeFirstLetter(widget.queryCity)}:',
              ),
              FutureBuilder<QuerySnapshot>(
                future:
                    firestoreService.getHotelByPlaceStream(widget.queryCity),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child:
                            const Center(child: CircularProgressIndicator()));
                  }
                  List hotelsList = snapshot.data!.docs;
                  return GridView.builder(
                      itemCount: hotelsList.length,
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
                        DocumentSnapshot document = hotelsList[index];
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String documentId = document.id;
                        return HotelCard(
                          thumbnailpath: thumbnailpaths[index],
                          name: data['name'],
                          city: data['city'].toUpperCase(),
                          hotelId: documentId,
                        );
                      });
                },
              ),
              SectionHeading(
                text: 'Rooms In ${capitalizeFirstLetter(widget.queryCity)}:',
              ),
              FutureBuilder<List<QueryDocumentSnapshot>>(
                future: firestoreService.getRoomsByCity(widget.queryCity),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child:
                            const Center(child: CircularProgressIndicator()));
                  }
                  var placeRooms = snapshot.data!;
                  return ListView.builder(
                      itemCount: placeRooms.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = placeRooms[index];
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String documentId = document.id;
                        String roomTitle = data['title'];
                        String roomProvider = data['provider'];
                        int roomDiscountedPrice =
                            (data['rent'] - data['discount']);
                        int roomOriginalPrice = data['rent'];
                        String roomTimespan = data['timespan'];
                        return RoomCardHorizontal(
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
