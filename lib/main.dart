import 'package:explorexpert/features/app/splash_screen.dart';
import 'package:explorexpert/features/user_auth/presentation/pages/login_page.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ExploreXpert',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: EXColors.primaryDark),
        useMaterial3: true,
      ),
      home: const SplashScreen(
        child: LoginPage(),
      ),
    );
  }
}
