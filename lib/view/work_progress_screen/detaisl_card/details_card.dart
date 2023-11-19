import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key, required this.isPassed, this.child});

  final bool isPassed;

  final child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        // margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isPassed ? Colors.green : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: child,
      ),
    );
  }
}
