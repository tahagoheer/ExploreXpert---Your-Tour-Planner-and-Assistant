import 'package:explorexpert/features/user_auth/presentation/pages/login_page.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/form_field_container_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                height: MediaQuery.of(context).size.height * 0.25,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/ExploreXpertLogo.png',
                        scale: 2.3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/ExploreXpertTitle.png',
                        scale: 1.3,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(252, 252, 252, 0.75),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(55),
                        topRight: Radius.circular(55))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: const Text(
                            'Welcome!',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: EXColors.primaryDark,
                            ),
                          ),
                        ),
                        const FormFieldContainerWidget(
                          hintText: 'Enter Username',
                          labelText: 'Username',
                          isPasswordField: false,
                        ),
                        const SizedBox(height: 10),
                        const FormFieldContainerWidget(
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                          isPasswordField: false,
                        ),
                        const SizedBox(height: 10),
                        const FormFieldContainerWidget(
                          hintText: 'Set a Password',
                          labelText: 'Password',
                          isPasswordField: true,
                        ),
                        const SizedBox(height: 10),
                        const FormFieldContainerWidget(
                          hintText: 'Confirm Your Password',
                          labelText: 'Confirm Password',
                          isPasswordField: true,
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: MaterialButton(
                            onPressed: () => print('Signup button pressed !'),
                            color: EXColors.primaryDark,
                            height: 60,
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?",
                                style: TextStyle(fontSize: 16)),
                            const SizedBox(
                              width: 3,
                              height: 60,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                    (route) => false);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: EXColors.primaryDark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const Row(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
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
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                  child: Icon(Icons.g_mobiledata),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
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
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                  child: Icon(Icons.facebook),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
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
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                  child: Icon(Icons.apple),
                                ),
                              ),
                            ),
                          ],
                        )
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
