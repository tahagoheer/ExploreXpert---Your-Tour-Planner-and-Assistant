import 'package:explorexpert/features/user_auth/presentation/pages/forgot_password_page.dart';
import 'package:explorexpert/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/form_field_container_widget.dart';
import 'package:explorexpert/global/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../global/toast.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSigning = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                height: MediaQuery.of(context).size.height * 0.30,
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
                height: MediaQuery.of(context).size.height * 0.70,
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
                        Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.05),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: EXColors.primaryDark,
                            ),
                          ),
                        ),
                        FormFieldContainerWidget(
                          hintText: 'Email',
                          labelText: 'Email',
                          isPasswordField: false,
                          controller: _emailController,
                        ),
                        const SizedBox(height: 10),
                        FormFieldContainerWidget(
                          hintText: 'Password',
                          labelText: 'Password',
                          isPasswordField: true,
                          controller: _passwordController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordPage()),
                                    (route) => false);
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: EXColors.primaryDark,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                  decorationColor: EXColors.primaryDark,
                                  decorationThickness: 1.8,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: MaterialButton(
                            onPressed: () {
                              _signIn();
                            },
                            color: EXColors.primaryDark,
                            height: 60,
                            mouseCursor: WidgetStateMouseCursor.clickable,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: _isSigning
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        'Login',
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
                            const Text("Don't have an account?",
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
                                            const SignUpPage()),
                                    (route) => false);
                              },
                              child: const Text(
                                'SignUp',
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
                              width: 60,
                              child: MaterialButton(
                                onPressed: () {
                                  _signInWithGoogle;
                                },
                                color: Colors.red,
                                height: 60,
                                mouseCursor: WidgetStateMouseCursor.clickable,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                  child: Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 60,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                color: Colors.blueAccent,
                                height: 60,
                                mouseCursor: WidgetStateMouseCursor.clickable,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                  child: Icon(
                                    Icons.facebook,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 60,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                color: EXColors.secondaryMedium,
                                height: 60,
                                mouseCursor: WidgetStateMouseCursor.clickable,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                  child: Icon(
                                    Icons.apple,
                                    color: Colors.white,
                                    size: 30,
                                  ),
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

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NavigationMenu()),
          (route) => false);
    } else {
      showToast(message: "some error occured");
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NavigationMenu()),
            (route) => false);
      }
    } catch (e) {
      showToast(message: "some error occured $e");
    }
  }
}
