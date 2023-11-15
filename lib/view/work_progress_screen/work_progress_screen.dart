import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class WorkProgressScreen extends StatelessWidget {
  const WorkProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustumIcon(fontSize: 22),
      ),
    );
  }
}
