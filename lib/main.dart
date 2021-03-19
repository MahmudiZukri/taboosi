import 'package:flutter/material.dart';
import 'package:taboosi/ui/pages/pages.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:taboosi/services/services.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      home: SplashPage(),
    );
  }
}
