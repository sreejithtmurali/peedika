import 'package:flutter/material.dart';
import 'package:peedika/views/dashboard.dart';
import 'package:peedika/views/home.dart';
import 'package:peedika/views/sendotp.dart';
import 'package:peedika/views/splash.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sendotp(),
    );
  }
}
