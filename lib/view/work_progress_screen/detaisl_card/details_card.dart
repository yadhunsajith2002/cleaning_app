import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key, required this.isPassed, this.child});

  final bool isPassed;

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isPassed ? Colors.green : Colors.green.shade300,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: child,
    );
  }
}
