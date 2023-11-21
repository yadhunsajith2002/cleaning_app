import 'package:cleaning_app/view/home_screen/home_screen.dart';
import 'package:cleaning_app/view/progress_screen/progress_screen.dart';
import 'package:cleaning_app/view/search_screen/search_screen.dart';
import 'package:cleaning_app/view/settings_screen/settings_screen.dart';
import 'package:cleaning_app/view/work_progress_screen/work_progress_screen.dart';
import 'package:flutter/material.dart';

class ScreenHomeController extends ChangeNotifier {
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ContractScreen(),
    WorkProgressScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 0;

  onTap({required int index}) {
    currentIndex = index;
    notifyListeners();
  }
}
