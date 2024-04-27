import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("All Hotels"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 70,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage("assets/images/allHotel1.png")),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 70,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage("assets/images/allHotel2.png")),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 70,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage("assets/images/allHotel3.png")),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 70,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage("assets/images/allHotel4.png")),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 70,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage("assets/images/allHotel2.png")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Text("Hotel Type"),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          color: EXColors.primaryLight,
                          border: Border.all(
                              color: EXColors.secondaryDark, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/allroom1.png")),
                                ),
                              ),
                              const Text(
                                'Trippe Bedroom',
                                style: TextStyle(
                                    color: EXColors.mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Starting From',
                                  style: TextStyle(
                                      color: EXColors.activeText, fontSize: 12),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'PKR 5000/Night',
                                    style: TextStyle(
                                        color: EXColors.activeText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '6500',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: EXColors.disabledText,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 140,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: EXColors.specialDark,
                                  height: 25,
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: EXColors.secondaryDark, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/allroom1.png")),
                                ),
                              ),
                              const Text(
                                'Trippe Bedroom',
                                style: TextStyle(
                                    color: EXColors.mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Starting From',
                                  style: TextStyle(
                                      color: EXColors.activeText, fontSize: 12),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'PKR 5000/Night',
                                    style: TextStyle(
                                        color: EXColors.activeText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '6500',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: EXColors.disabledText,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 140,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: EXColors.specialDark,
                                  height: 25,
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: EXColors.secondaryDark, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/allroom1.png")),
                                ),
                              ),
                              const Text(
                                'Trippe Bedroom',
                                style: TextStyle(
                                    color: EXColors.mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Starting From',
                                  style: TextStyle(
                                      color: EXColors.activeText, fontSize: 12),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'PKR 5000/Night',
                                    style: TextStyle(
                                        color: EXColors.activeText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '6500',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: EXColors.disabledText,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 140,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: EXColors.specialDark,
                                  height: 25,
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: EXColors.secondaryDark, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/allroom1.png")),
                                ),
                              ),
                              const Text(
                                'Trippe Bedroom',
                                style: TextStyle(
                                    color: EXColors.mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Starting From',
                                  style: TextStyle(
                                      color: EXColors.activeText, fontSize: 12),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'PKR 5000/Night',
                                    style: TextStyle(
                                        color: EXColors.activeText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '6500',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: EXColors.disabledText,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 140,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: EXColors.specialDark,
                                  height: 25,
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: EXColors.secondaryDark, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/allroom1.png")),
                                ),
                              ),
                              const Text(
                                'Trippe Bedroom',
                                style: TextStyle(
                                    color: EXColors.mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Starting From',
                                  style: TextStyle(
                                      color: EXColors.activeText, fontSize: 12),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'PKR 5000/Night',
                                    style: TextStyle(
                                        color: EXColors.activeText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '6500',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: EXColors.disabledText,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 140,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: EXColors.specialDark,
                                  height: 25,
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: EXColors.secondaryDark, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/allroom1.png")),
                                ),
                              ),
                              const Text(
                                'Trippe Bedroom',
                                style: TextStyle(
                                    color: EXColors.mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Starting From',
                                  style: TextStyle(
                                      color: EXColors.activeText, fontSize: 12),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'PKR 5000/Night',
                                    style: TextStyle(
                                        color: EXColors.activeText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '6500',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: EXColors.disabledText,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 140,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: EXColors.specialDark,
                                  height: 25,
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: EXColors.secondaryDark, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/allroom1.png")),
                                ),
                              ),
                              const Text(
                                'Trippe Bedroom',
                                style: TextStyle(
                                    color: EXColors.mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Starting From',
                                  style: TextStyle(
                                      color: EXColors.activeText, fontSize: 12),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'PKR 5000/Night',
                                    style: TextStyle(
                                        color: EXColors.activeText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '6500',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: EXColors.disabledText,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 140,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: EXColors.specialDark,
                                  height: 25,
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: EXColors.secondaryDark, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/allroom1.png")),
                                ),
                              ),
                              const Text(
                                'Trippe Bedroom',
                                style: TextStyle(
                                    color: EXColors.mainText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Starting From',
                                  style: TextStyle(
                                      color: EXColors.activeText, fontSize: 12),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'PKR 5000/Night',
                                    style: TextStyle(
                                        color: EXColors.activeText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '6500',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: EXColors.disabledText,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 140,
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: EXColors.specialDark,
                                  height: 25,
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 10,
              child: Card(
                color: EXColors.secondaryLight,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/allroom1.png")),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Trippe Bedroom',
                          style: TextStyle(
                              color: EXColors.mainText,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Starting From',
                          style: TextStyle(
                              color: EXColors.activeText, fontSize: 12),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'PKR 5000/Night',
                              style: TextStyle(
                                  color: EXColors.activeText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Text(
                              '6500',
                              style: TextStyle(
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
                          onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
