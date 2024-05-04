import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
  });
  final String image, title;

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          image: AssetImage(widget.image),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  stops: [0.3, 0.9],
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          bottom: 100,
          left: 30,
          child: Text(
            widget.title,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
          ),
        )
      ],
    );
  }
}
