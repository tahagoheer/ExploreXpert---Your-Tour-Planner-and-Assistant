import 'package:flutter/material.dart';

import 'essentials.dart';

class SearchSectionHeading extends StatelessWidget {
  final String? text;
  const SearchSectionHeading({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, bottom: 10, left: 10),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: EXColors.primaryDark, width: 3))),
        child: Text(
          "$text",
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
