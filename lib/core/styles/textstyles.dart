import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(
    {double size = 20, Color? color = Colors.white, FontWeight? weight}) {
  return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: weight);
}
