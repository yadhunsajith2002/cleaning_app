import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/view/screens/work_progress_screen/time_line/time_line.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            MyTimeLine(
              isFirt: true,
              isPast: true,
              isLast: false,
              progressCard: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Contract Signed",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.done),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Got details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.done),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Confirm contract",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.done),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            MyTimeLine(
              isFirt: false,
              isPast: true,
              isLast: false,
              progressCard: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Workers are arrived",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.done),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Started Work",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.done),
                      ],
                    ),
                    // Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     Text(
                    //       "Contract Signed",
                    //       style: TextStyle(
                    //           fontSize: 18, fontWeight: FontWeight.bold),
                    //     ),
                    //     Icon(Icons.done),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            MyTimeLine(
              isFirt: false,
              isPast: false,
              isLast: false,
              progressCard: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Completed work",
                      style: TextStyle(fontSize: 22, color: Colors.black45),
                    ),
                    Text(
                      "Uplaod images",
                      style: TextStyle(fontSize: 22, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
            MyTimeLine(
              isFirt: false,
              isPast: false,
              isLast: true,
              progressCard: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Payement Status",
                      style: TextStyle(fontSize: 22, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade400),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Continue"),
        ),
      ),
    );
  }
}
