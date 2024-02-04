import 'package:explorexpert/features/user_auth/presentation/pages/login_page.dart';
import 'package:explorexpert/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';

class AuthViaPage extends StatelessWidget {
  const AuthViaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/Pexels Photo by Mikhail Nilov.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.42,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.09,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/ExploreXpertLogo.png',
                        scale: 1,
                      ),
                      Image.asset(
                        'assets/images/ExploreXpertTitle.png',
                        scale: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.58,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(252, 252, 252, 0.75),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(55),
                        topRight: Radius.circular(55))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                color: Colors.white,
                                height: 60,
                                mouseCursor: MaterialStateMouseCursor.clickable,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                  child: Text(
                                    'SignUp',
                                    style: TextStyle(
                                        color: EXColors.primaryDark,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                color: EXColors.primaryDark,
                                height: 60,
                                mouseCursor: MaterialStateMouseCursor.clickable,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 100,
                                child: Divider(
                                  color: EXColors.secondaryMedium,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                      color: EXColors.secondaryMedium,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 100,
                                child: Divider(
                                  color: EXColors.secondaryMedium,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                color: Colors.white,
                                height: 50,
                                mouseCursor: MaterialStateMouseCursor.clickable,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 1, right: 10),
                                      child: Icon(Icons.g_mobiledata,
                                          size: 40,
                                          color: EXColors.secondaryMedium),
                                    ),
                                    Text(
                                      'Continue with Google',
                                      style: TextStyle(
                                        color: EXColors.secondaryMedium,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                color: Colors.white,
                                height: 50,
                                mouseCursor: MaterialStateMouseCursor.clickable,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 15),
                                      child: Icon(Icons.facebook,
                                          size: 28,
                                          color: EXColors.secondaryMedium),
                                    ),
                                    Text(
                                      'Continue with Facebook',
                                      style: TextStyle(
                                        color: EXColors.secondaryMedium,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                color: Colors.white,
                                height: 50,
                                mouseCursor: MaterialStateMouseCursor.clickable,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 15),
                                      child: Icon(Icons.apple,
                                          size: 28,
                                          color: EXColors.secondaryMedium),
                                    ),
                                    Text(
                                      'Continue with Apple',
                                      style: TextStyle(
                                        color: EXColors.secondaryMedium,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
