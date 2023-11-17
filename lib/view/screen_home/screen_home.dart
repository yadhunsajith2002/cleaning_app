import 'package:cleaning_app/view/progress_screen/progress_screen.dart';
import 'package:cleaning_app/view/home_screen/home_screen.dart';
import 'package:cleaning_app/view/search_screen/search_screen.dart';
import 'package:cleaning_app/view/work_progress_screen/work_progress_screen.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ContractScreen(),
    WorkProgressScreen(),
    SearchScreen(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                    child: Icon(
                      Icons.currency_ruble_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 4;
                      });
                    },
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: CircleAvatar(
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                    radius: 25,
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
