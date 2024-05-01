import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PostsGrid extends StatefulWidget {
  const PostsGrid({super.key});

  @override
  State<PostsGrid> createState() => _PostsGridState();
}

class _PostsGridState extends State<PostsGrid> {
  final thumbnailpaths = [
    'assets/images/PG1.png',
    'assets/images/PG2.png',
    'assets/images/PG3.png',
    'assets/images/PG4.png',
    'assets/images/PG5.png',
    'assets/images/PG1.png',
    'assets/images/PG2.png',
    'assets/images/PG3.png',
    'assets/images/PG4.png',
    'assets/images/PG5.png',
    'assets/images/PG1.png',
    'assets/images/PG2.png',
    'assets/images/PG3.png',
    'assets/images/PG4.png',
    'assets/images/PG5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 15,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) => Container(
        foregroundDecoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(image: AssetImage(thumbnailpaths[index]))),
      ),
    );
  }
}
