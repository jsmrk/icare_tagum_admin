import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:icare_tagum_admin/login/login_screen.dart';
import 'package:icare_tagum_admin/side_nav/side_nav.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const LoginScreen(),
        SideNav.routeName: (context) => const SideNav(),
      },
    );
  }
}
