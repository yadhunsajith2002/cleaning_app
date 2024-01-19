import 'package:flutter/material.dart';

import 'package:cleaning_app/global%20widgets/custom_icon.dart';

class CompanyDetails extends StatefulWidget {
  CompanyDetails({super.key, required this.index});

  final int index;

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: CustumIcon(fontSize: 20),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Center());
  }
}
