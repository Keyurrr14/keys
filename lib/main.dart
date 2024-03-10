import 'package:flutter/material.dart';
import 'package:keys/pages/welcome.dart';
import 'package:keys/pages/signup.dart';
import 'package:keys/pages/login.dart';
import 'package:keys/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// void main() {
//   runApp(const MyApp());
// }

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Euclid Circular B'),
        home: const WelcomePage());
  }
}
