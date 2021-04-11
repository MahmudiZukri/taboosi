import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taboosi/shared/shared.dart';
import 'package:taboosi/ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: turquoiseColor),
      home: SplashPage(),
    );
  }
}
