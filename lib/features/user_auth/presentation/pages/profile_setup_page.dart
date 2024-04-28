import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/interest_selection.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/language_selection.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/profile_review_pageview.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/profile_setup_page_header.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final _controller = PageController();
  // ignore: unused_field
  int _currentPage = 0;

  int currentStep = 1;
  @override
  Widget build(BuildContext context) {
    String headertxt = 'Your Response';
    final List<String> titles = [
      'Language',
      'Interests',
      'Profile',
      'Review',
    ];
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );
    return Scaffold(
      appBar: AppBar(
        title: const ProfileSetupHeader(),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              headertxt,
              style: const TextStyle(
                fontSize: 25,
                color: EXColors.secondaryDark,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
            child: StepProgressView(
              key: const Key('step_progress_key'),
              width: MediaQuery.of(context).size.width,
              curStep: currentStep - 1,
              completedColor: EXColors.secondaryDark,
              notCompletedColor: EXColors.secondaryMedium,
              activeColor: EXColors.primaryDark,
              titles: titles,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Column(
                        children: [
                          Icon(
                            Icons.translate_rounded,
                            color: EXColors.primaryDark,
                            size: 70,
                          ),
                          Text(
                            'Select a language you can speak',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      LanguageSelection(),
                      ElevatedButton(
                        onPressed: () => {
                          currentStep = 2,
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          )
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Column(
                        children: [
                          Icon(
                            Icons.favorite_outline_rounded,
                            size: 70,
                            color: EXColors.primaryDark,
                          ),
                          Text(
                            'Selecting things you\'re interested in &\nwe\'ll help you connect with people sharing same interest as you ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const InterestSelection(),
                      ElevatedButton(
                        onPressed: () => {
                          currentStep = 3,
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          )
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Column(
                        children: [
                          Icon(
                            Icons.female_rounded,
                            size: 70,
                            color: EXColors.primaryDark,
                          ),
                          Text(
                            'You\'re about to start exploring, so\ntell about yourself!',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      // ProfilePage3(),
                      MaterialButton(
                        onPressed: () => {
                          currentStep = 4,
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          )
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Column(
                        children: [
                          Icon(
                            Icons.menu_book_sharp,
                            size: 100,
                          ),
                          Text('View your Profile')
                        ],
                      ),
                      const ProfileWidget4(),
                      MaterialButton(
                        onPressed: () {
                          // Handle submit action here
                        },
                        color: EXColors.primaryDark,
                        height: 40,
                        minWidth: 100,
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text('Submit'),
                      ),
                      MaterialButton(
                        onPressed: () => {
                          currentStep = 1,
                          _controller.jumpToPage(0),
                        },
                        color: EXColors.primaryDark,
                        height: 40,
                        minWidth: 100,
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text('Go to First Tab'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
