import 'package:cleaning_app/controller/create_account_controller/create_account_controller.dart';
import 'package:cleaning_app/controller/screen_home_controller/screen_home_controller.dart';
import 'package:cleaning_app/controller/task_controller/task_controller.dart';
import 'package:cleaning_app/firebase_options.dart';
import 'package:cleaning_app/view/auth/create_account/ceate_acc_screen.dart';

import 'package:cleaning_app/view/intro/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateAccountController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScreenHomeController(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          title: 'Flutter Demo',
          home: CreateAccountScreen()),
    );
  }
}
