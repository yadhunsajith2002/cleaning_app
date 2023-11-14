import 'package:cleaning_app/controller/home_controller/home_controller.dart';
import 'package:cleaning_app/view/home_screen/home_screen.dart';
import 'package:cleaning_app/view/screen_home/screen_home.dart';
import 'package:cleaning_app/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      title: 'Flutter Demo',
      home: ScreenHome(),
    );
  }
}
