import 'package:cleaning_app/controller/screen_home_controller/screen_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    var providerwatch = context.watch<ScreenHomeController>();
    var providerRead = context.read<ScreenHomeController>();

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
                        providerRead.onTap(index: 0);
                      },
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        providerRead.onTap(index: 1);
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
                        providerRead.onTap(index: 3);
                      },
                      child: Icon(
                        Icons.currency_ruble_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        providerRead.onTap(index: 4);
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
                      providerRead.onTap(index: 2);
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
        body: providerwatch.screens[providerwatch.currentIndex]);
  }
}
