import 'package:explorexpert/features/app/splash_screen.dart';
import 'package:explorexpert/features/user_auth/presentation/pages/auth_via_page.dart';
<<<<<<< HEAD
import 'package:explorexpert/features/user_auth/presentation/pages/profile_setup_page.dart';
=======
>>>>>>> 0ad9d5624835cb3008e40b0f6b1646b993d43116
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
        debugShowCheckedModeBanner: false,
        title: 'ExploreXpert',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: EXColors.primaryDark),
          useMaterial3: true,
        ),
        home: const ProfileSetupPage()
        // const SplashScreen(
        //   child: AuthViaPage(),
        // ),
        );
=======
      debugShowCheckedModeBanner: false,
      title: 'ExploreXpert',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: EXColors.primaryDark),
        useMaterial3: true,
      ),
      home: const SplashScreen(
        child: AuthViaPage(),
      ),
    );
>>>>>>> 0ad9d5624835cb3008e40b0f6b1646b993d43116
  }
}
