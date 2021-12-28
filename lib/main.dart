import 'package:flutter/material.dart';
import 'package:new_york_times_articles/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff46e4c1);
    return MaterialApp(
      title: 'The New York Times',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
        ),
        backgroundColor: primaryColor,
      ),
      home: const Splash(),
    );
  }
}
