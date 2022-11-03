import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';


class AppFonts {
  static TextStyle heading1 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 18,
      color: Pallete.kPrimaryColor,
      fontWeight: FontWeight.w700,
    ),
  );

  static TextStyle body1 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      color: Pallete.kGravishColor,
      fontWeight: FontWeight.w400,
    ),
  );

 static TextStyle H1 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 24,
      color: Pallete.kPrimaryColor,
      fontWeight: FontWeight.w700,
    ),
  );
  static TextStyle heading2 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Pallete.kText,
    ),
  );

  static TextStyle body3 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: Pallete.kPrimaryColor,
    ),
  );

  static TextStyle coloredHeading = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Pallete.kPrimaryColor,
    ),
  );

  static TextStyle errorStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 12,
      backgroundColor: Colors.transparent,
    ),
  );

  static TextStyle labelStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Pallete.kPrimaryColor,
    ),
  );

  static TextStyle hintStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Pallete.khint,
    ),
  );
static TextStyle lightTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300
      
    ),
  );
  static TextStyle dialogColoredText = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: Color(0xFF007AFF),
      fontSize: 17,
    ),
  );
}
