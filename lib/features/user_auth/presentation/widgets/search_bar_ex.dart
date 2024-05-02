import 'package:flutter/material.dart';

import 'essentials.dart';

class ExSearchBar extends StatelessWidget {
  const ExSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: EXColors.primaryLight,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: EXColors.primaryDark),
              borderRadius: BorderRadius.circular(15)),
          labelText: 'Search',
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: EXColors.primaryLight),
              borderRadius: BorderRadius.circular(15)),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
