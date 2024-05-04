import 'package:explorexpert/features/user_auth/presentation/widgets/must_visit_places.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/packages_card.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/search_bar_ex.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/top_attractions_card.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/travel_guides_card.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/travel_theme_card.dart';
import 'package:flutter/material.dart';
import '../../user_auth/presentation/widgets/search_section_heading.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExSearchBar(),
                SearchSectionHeading(
                  text: 'Travel Themes',
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TravelThemeCard(
                        title: 'Hill\nStations',
                        thumbnailpath: 'assets/images/TT1.png',
                      ),
                      TravelThemeCard(
                        title: 'Beach\nVacations',
                        thumbnailpath: 'assets/images/TT2.png',
                      ),
                      TravelThemeCard(
                        title: 'Weekly\nGatevays',
                        thumbnailpath: 'assets/images/TT3.png',
                      )
                    ],
                  ),
                ),
                SearchSectionHeading(
                  text: 'Must Visit Places',
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MustVisitPlaces(
                        rating: 3.9,
                        title: 'Multan',
                        thumbnailpath: 'assets/images/MVP1.png',
                      ),
                      MustVisitPlaces(
                        rating: 4.1,
                        title: 'Lahore',
                        thumbnailpath: 'assets/images/MVP2.png',
                      ),
                      MustVisitPlaces(
                        rating: 4.7,
                        title: 'Islamabad',
                        thumbnailpath: 'assets/images/MVP3.png',
                      ),
                      MustVisitPlaces(
                        rating: 3.2,
                        title: 'Vehari',
                        thumbnailpath: 'assets/images/MVP4.png',
                      )
                    ],
                  ),
                ),
                SearchSectionHeading(
                  text: 'Packages',
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PackagesCard(
                        label: 'Holiday',
                        days: 6,
                        nights: 5,
                        currency: 'PKR',
                        price: 50000,
                        rating: 3.9,
                        title: 'Mirpur & Kashmir Tour Package',
                        thumbnailpath: 'assets/images/PKG1.png',
                      ),
                      PackagesCard(
                        label: 'Holiday',
                        days: 6,
                        nights: 5,
                        currency: 'PKR',
                        price: 40000,
                        rating: 4.5,
                        title: 'Northern Areas Tour Package',
                        thumbnailpath: 'assets/images/PKG2.png',
                      ),
                    ],
                  ),
                ),
                SearchSectionHeading(
                  text: 'Travel Guides',
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TravelGuidesCard(
                        thumbnailpath: 'assets/images/TG1.png',
                        title: 'Seaview Karachi',
                      ),
                      TravelGuidesCard(
                        thumbnailpath: 'assets/images/TG2.png',
                        title: 'Margalla Hills',
                      )
                    ],
                  ),
                ),
                SearchSectionHeading(
                  text: 'Top Attractions',
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TopAttractionsCard(
                        thumbnailpath: 'assets/images/TA1.png',
                        title: 'Cherry Blossom',
                      ),
                      TopAttractionsCard(
                        thumbnailpath: 'assets/images/TA2.png',
                        title: 'Head Islam',
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
