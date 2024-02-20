import 'package:flutter/material.dart';
import 'package:keys/pages/welcome.dart';
import 'package:keys/pages/signup.dart';
import 'package:keys/pages/login.dart';
import 'package:keys/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Euclid Circular B'),
      home: const WelcomePage()
    );
  }
}

