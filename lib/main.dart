import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/controller/task_controller/task_controller.dart';
import 'package:cleaning_app/view/contract_details_screen/task_details_screen.dart';
import 'package:cleaning_app/view/screen_home/screen_home.dart';
import 'package:cleaning_app/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContractController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskController(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          title: 'Flutter Demo',
          home: ScreenHome()),
    );
  }
}
