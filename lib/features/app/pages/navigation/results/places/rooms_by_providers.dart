import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/app/pages/navigation/nav_widgets/ex_appbar.dart';
import 'package:explorexpert/features/repos/fetch_data/get_places.dart';
import 'package:flutter/material.dart';

import '../../../../../../global/utilities/capitalize_first_letter.dart';
import '../../../../../user_auth/presentation/widgets/room_card_horizontal.dart';
import '../../../../../user_auth/presentation/widgets/section_heading.dart';

class RoomsByProviderPage extends StatefulWidget {
  final String queryProvider;
  const RoomsByProviderPage(
    this.queryProvider, {
    super.key,
  });

  @override
  State<RoomsByProviderPage> createState() => _RoomsByProviderPageState();
}

class _RoomsByProviderPageState extends State<RoomsByProviderPage> {
  final FireStoreServicep firestoreService = FireStoreServicep();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EXAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeading(
                text:
                    'Rooms By ${capitalizeFirstLetter(widget.queryProvider)}:',
              ),
              FutureBuilder<List<QueryDocumentSnapshot>>(
                future:
                    firestoreService.getRoomsByProvider(widget.queryProvider),
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
                          thumbnailpath: data['images'][0],
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
