import 'package:explorexpert/features/user_auth/presentation/widgets/check_box_list.dart';
import 'package:flutter/material.dart';

class InterestSelection extends StatelessWidget {
  const InterestSelection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> interests = [
      'Adventure',
      'Camping',
      'Photography',
      'Heritage',
      'Mountains',
      'Beaches',
      'Trekking'
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: CheckBoxGrid(
        titles: interests,
        crossAxisCount: 2,
      ),
    );
  }
}
