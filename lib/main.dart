import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:umer/User/View/bottombar.dart';
import 'package:umer/User/View/cart_screen.dart';
import 'package:umer/User/View/explore_screen.dart';
import 'package:umer/User/View/fetch_screen.dart';
import 'package:umer/User/View/product_screen.dart';
import 'package:umer/User/View/update_user.dart';
import 'package:umer/User/View/user_login.dart';
import 'package:umer/User/View/user_register.dart';
import 'package:umer/User/View/whist_list.dart';
import 'package:umer/firebase_options.dart';
import 'package:umer/splash_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CurrenSee',
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
    );
  }
}