import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/app/pages/onboarding/onboarding_screen.dart';
import 'package:explorexpert/features/app/pages/splash_screen.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:explorexpert/global/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var auth = FirebaseAuth.instance;
  bool isLoggedIn = false;

  checkIfSignedIn() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLoggedIn = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfSignedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ExploreXpert',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: EXColors.primaryDark),
        useMaterial3: true,
      ),
      home: SplashScreen(
        child: isLoggedIn ? const NavigationMenu() : const OnBoardingScreen(),
      ),
    );
  }
}
