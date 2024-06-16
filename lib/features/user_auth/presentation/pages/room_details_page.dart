import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/user_auth/presentation/pages/room_booking_page.dart';
import 'package:flutter/material.dart';
import '../../../repos/fetch_data/get_room_details.dart';
import '../widgets/essentials.dart';

class RoomDetailsPage extends StatefulWidget {
  final String roomId;
  const RoomDetailsPage(this.roomId, {super.key});

  @override
  State<RoomDetailsPage> createState() => _RoomDetailsPageState();
}

class _RoomDetailsPageState extends State<RoomDetailsPage> {
  final FireStoreService firestoreService = FireStoreService();

  final descriptionTitles = ['Room #', 'Floor #', 'Facilities', 'Offers'];

  final contactTitles = ['Phone #', 'Address', 'E-Mail', 'Website'];
  String _roomProvider = 'null';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: EXColors.primaryDark,
        automaticallyImplyLeading: true,
        leading: const BackButton(),
        backgroundColor: Colors.white54,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 Product Image Slider
            Stack(
              children: [
                Container(
                  height: 330,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/roomTest.png'))),
                ),
                Positioned(
                  right: 0,
                  bottom: 10,
                  left: 0,
                  child: Container(
                    height: 90,
                    color: Colors.white54,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 12),
                      child: ListView.separated(
                        itemCount: 6,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        itemBuilder: (context, index) => Container(
                          width: 80,
                          padding: const EdgeInsets.all(8.0),
                          foregroundDecoration: BoxDecoration(
                            border: Border.all(color: EXColors.primaryDark),
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/allroom1.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 3, height: 0, color: EXColors.primaryDark),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<DocumentSnapshot>(
                    future:
                        firestoreService.getRoomDetailsStream(widget.roomId),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: const Center(
                                child: CircularProgressIndicator()));
                      }
                      var roomData =
                          snapshot.data!.data() as Map<String, dynamic>;
                      var facilities = roomData['facility'];
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          _roomProvider = roomData['provider'];
                        });
                      });
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              roomData['title'],
                              style: const TextStyle(
                                  color: EXColors.mainText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            child: Text(
                              'By: ${roomData['provider']}',
                              style: const TextStyle(
                                  color: EXColors.mainText, fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'PKR ${roomData['rent'] - roomData['discount']}/Night'
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      color: EXColors.activeText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                                Text(
                                  roomData['rent'].toString(),
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: EXColors.secondaryDark,
                                      decorationThickness: 1,
                                      color: EXColors.disabledText,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const Divider(
                              thickness: 3,
                              height: 0,
                              indent: 1,
                              endIndent: 1,
                              color: EXColors.primaryDark),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: descriptionTitles.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: SizedBox(
                                  width: 100,
                                  child: Text(
                                    '${descriptionTitles[index]}:',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                title: Align(
                                  alignment: Alignment.topLeft,
                                  child: (index == 2)
                                      ? SizedBox(
                                          height: facilities.length * 30.0,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: facilities.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Text(
                                                  facilities[index],
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black),
                                                );
                                              }),
                                        )
                                      : Text(
                                          (index == 0)
                                              ? roomData['room_number']
                                              : (index == 1)
                                                  ? roomData['floor'].toString()
                                                  : roomData['offers'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                  thickness: 1,
                                  height: 0,
                                  indent: 12,
                                  endIndent: 12,
                                  color: EXColors.disabledText);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  FutureBuilder<QuerySnapshot>(
                    future:
                        firestoreService.getHotelDetailsStream(_roomProvider),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      var querySnapshot = snapshot.data!;
                      if (querySnapshot.docs.isEmpty) {
                        return const Text(
                            'No user found with the provided name');
                      }
                      var hotelData = querySnapshot.docs.first.data()
                          as Map<dynamic, dynamic>;
                      var phones = hotelData['phones'];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Contact",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const Divider(
                              thickness: 3,
                              height: 0,
                              indent: 1,
                              endIndent: 1,
                              color: EXColors.primaryDark),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: contactTitles.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: SizedBox(
                                  width: 100,
                                  child: Text(
                                    '${contactTitles[index]}:',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                title: Align(
                                  alignment: Alignment.topLeft,
                                  child: (index == 0)
                                      ? SizedBox(
                                          height: phones.length * 30.0,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: phones.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Text(
                                                  phones[index],
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black),
                                                );
                                              }),
                                        )
                                      : Text(
                                          (index == 1)
                                              ? hotelData['address']
                                              : (index == 2)
                                                  ? hotelData['email']
                                                  : hotelData['website'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                  thickness: 1,
                                  height: 0,
                                  indent: 12,
                                  endIndent: 12,
                                  color: EXColors.disabledText);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Stack(
      //     children: [
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           /// 1 Product Image Slider
      //           Stack(
      //             children: [
      //               Container(
      //                 height: 330,
      //                 decoration: const BoxDecoration(
      //                     image: DecorationImage(
      //                         fit: BoxFit.fill,
      //                         image: AssetImage('assets/images/roomTest.png'))),
      //               ),
      //               Positioned(
      //                 right: 0,
      //                 bottom: 10,
      //                 left: 0,
      //                 child: Container(
      //                   height: 90,
      //                   color: Colors.white54,
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(
      //                         vertical: 5.0, horizontal: 12),
      //                     child: ListView.separated(
      //                       itemCount: 6,
      //                       shrinkWrap: true,
      //                       scrollDirection: Axis.horizontal,
      //                       physics: const AlwaysScrollableScrollPhysics(),
      //                       separatorBuilder: (context, index) =>
      //                           const SizedBox(width: 16),
      //                       itemBuilder: (context, index) => Container(
      //                         width: 80,
      //                         padding: const EdgeInsets.all(8.0),
      //                         foregroundDecoration: BoxDecoration(
      //                           border: Border.all(color: EXColors.primaryDark),
      //                           borderRadius: BorderRadius.circular(10),
      //                           image: const DecorationImage(
      //                               image: AssetImage(
      //                                   'assets/images/allroom1.png'),
      //                               fit: BoxFit.cover),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 5),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const Padding(
      //                   padding: EdgeInsets.only(top: 5.0),
      //                   child: Text(
      //                     'Trippe Bed Room',
      //                     style: TextStyle(
      //                         color: EXColors.mainText,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 24),
      //                   ),
      //                 ),
      //                 const Padding(
      //                   padding: EdgeInsets.symmetric(vertical: 0.0),
      //                   child: Text(
      //                     'By: ExploreXpert',
      //                     style:
      //                         TextStyle(color: EXColors.mainText, fontSize: 14),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 5.0, right: 10),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text(
      //                         'PKR 5000/Night'.toUpperCase(),
      //                         style: const TextStyle(
      //                             color: EXColors.activeText,
      //                             fontWeight: FontWeight.normal,
      //                             fontSize: 20),
      //                       ),
      //                       const Text(
      //                         '6500',
      //                         style: TextStyle(
      //                             decoration: TextDecoration.lineThrough,
      //                             decorationColor: EXColors.secondaryDark,
      //                             decorationThickness: 1,
      //                             color: EXColors.disabledText,
      //                             fontSize: 20),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 const Padding(
      //                   padding: EdgeInsets.symmetric(vertical: 10),
      //                   child: Text(
      //                     "Description",
      //                     style: TextStyle(
      //                         fontSize: 22,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.black),
      //                   ),
      //                 ),
      //                 const Padding(
      //                   padding: EdgeInsets.symmetric(horizontal: 10),
      //                   child: Column(
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "Room #:",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             width: 25,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "28",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.normal,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "Floor #:",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             width: 30,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "2",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.normal,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       Row(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "Facilities:",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             width: 16,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "Business Centre\nClub Lounge\nHealth Club\nSwimming Pool\nFitness Zone\nSpa",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.normal,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       Row(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "Address:",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             width: 19,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "Adda Pir Murad, Multan Road,\nVehari",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.normal,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "Offers:",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             width: 35,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "NO offers yet",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.normal,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 const Padding(
      //                   padding: EdgeInsets.symmetric(vertical: 10),
      //                   child: Text(
      //                     "Contact",
      //                     style: TextStyle(
      //                         fontSize: 22,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.black),
      //                   ),
      //                 ),
      //                 const Padding(
      //                   padding: EdgeInsets.symmetric(horizontal: 10),
      //                   child: Column(
      //                     children: [
      //                       Row(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "Phone #:",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             width: 15,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "+92 304 0660059,\n+92 322 1340159",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.normal,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "E-mail:",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             width: 30,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "tahagoheer59@gmail.com",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.normal,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "Website:",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             width: 15,
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(bottom: 10),
      //                             child: Text(
      //                               "explorexpert-68106.web.app",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.normal,
      //                                   color: Colors.black),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        surfaceTintColor: EXColors.primaryDark,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 10,
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RoomBookingPage()),
              );
            },
            color: EXColors.specialDark,
            height: 50,
            mouseCursor: WidgetStateMouseCursor.clickable,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book Now',
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
    );
  }
}
