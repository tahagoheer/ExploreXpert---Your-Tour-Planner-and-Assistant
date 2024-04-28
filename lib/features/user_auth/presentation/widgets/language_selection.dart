import 'package:explorexpert/features/user_auth/presentation/widgets/check_box_list.dart';
import 'package:flutter/material.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> languages = [
      'English',
      'हिन्दी',
      'ગુજરાતી',
      'తెలుగు',
      'मराठी',
      'বাংলা',
      'ਪੰਜਾਬੀ'
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: CheckBoxGrid(
        titles: languages,
        crossAxisCount: 3,
      ),
    );
  }
}
