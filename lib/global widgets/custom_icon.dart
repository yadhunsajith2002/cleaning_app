import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustumIcon extends StatelessWidget {
  CustumIcon({
    super.key,
    required this.fontSize,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "i D U S T",
          style: GoogleFonts.poppins(
              color: Colors.green,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.home_outlined,
          size: fontSize,
        )
      ],
    );
  }
}
