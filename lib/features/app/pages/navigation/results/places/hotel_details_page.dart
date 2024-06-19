import 'package:flutter/material.dart';

import '../../nav_widgets/ex_post_appbar.dart';
import '../../nav_widgets/ex_post_bottombar.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/city4.jpg'),
            fit: BoxFit.cover,
            opacity: 0.7),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: EXPostAppBar(),
        ),
        bottomNavigationBar: EXPostBottomBar(),
      ),
    );
  }
}
