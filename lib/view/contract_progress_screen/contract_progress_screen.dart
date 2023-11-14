import 'package:cleaning_app/controller/database_controller/database_controller.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
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
