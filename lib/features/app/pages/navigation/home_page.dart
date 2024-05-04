import 'package:explorexpert/features/user_auth/presentation/widgets/room_card.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../user_auth/presentation/widgets/hotel_type_card.dart';
import '../../../user_auth/presentation/widgets/places_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  final titles = [
    '2 Nmbr Bedroom',
    'Trippe Bedroom',
    'Trippe Bedroom',
    '2 Nmbr Bedroom',
    '2 Nmbr Bedroom',
    'Trippe Bedroom',
    'Trippe Bedroom',
    '2 Nmbr Bedroom'
  ];
  final providers = [
    'ExploreXpert',
    'COMSATS Hotels',
    'Taha Goheer',
    'ExploreXpert',
    'COMSATS Hotels',
    'Taha Goheer',
    'ExploreXpert',
    'COMSATS Hotels'
  ];
  final prices = [9000, 5000, 5000, 9000, 9000, 5000, 5000, 9000];
  final discounts = [6500, 10000, 10000, 6500, 6500, 10000, 10000, 6500];
  final currencies = ['PKR', 'PKR', 'PKR', 'PKR', 'PKR', 'PKR', 'PKR', 'PKR'];
  final timespans = [
    'Day',
    'Night',
    'Night',
    'Day',
    'Day',
    'Night',
    'Night',
    'Day'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/ExploreXpertTitleAppBar.png',
          height: 25,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/userprofile1.png'),
              radius: 25,
            ),
          )
        ],
      ),
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
                    ),
                    PlacesCard(
                      thumbnailpath: 'assets/images/allHotel2.png',
                      title: 'Lahore',
                    ),
                    PlacesCard(
                      thumbnailpath: 'assets/images/allHotel3.png',
                      title: 'Multan',
                    ),
                    PlacesCard(
                      thumbnailpath: 'assets/images/allHotel4.png',
                      title: 'Faisalabad',
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
              SingleChildScrollView(
                child: GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 4.0,
                    mainAxisExtent: 260,
                  ),
                  itemBuilder: (_, index) => RoomCard(
                    thumbnailpath: thumbnailpaths[index],
                    title: titles[index],
                    provider: providers[index],
                    currency: currencies[index],
                    price: prices[index],
                    timespan: timespans[index],
                    discount: discounts[index],
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
