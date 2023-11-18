import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/view/work_progress_screen/time_line/time_line.dart';
import 'package:flutter/material.dart';

class ProgressTimeLine extends StatelessWidget {
  const ProgressTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustumIcon(fontSize: 22),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            MyTimeLine(
              isFirt: true,
              isPast: true,
              isLast: false,
              progressCard: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                ],
              ),
            ),
            MyTimeLine(
              isFirt: false,
              isPast: true,
              isLast: false,
              progressCard: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                ],
              ),
            ),
            MyTimeLine(
              isFirt: false,
              isPast: false,
              isLast: false,
              progressCard: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                ],
              ),
            ),
            MyTimeLine(
              isFirt: false,
              isPast: false,
              isLast: true,
              progressCard: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                  Text("Cleaning Work added"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
