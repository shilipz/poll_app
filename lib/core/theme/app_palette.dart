import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPalette {
  static const Color kWhite = Colors.white;

  static const Color kGrey = Color.fromRGBO(210, 210, 210, 1);
  static final Color transGrey = Colors.grey.withOpacity(0.5);
  static final Color transOrange = Colors.orange.withOpacity(0.5);
  static const Color commentColor = Color.fromRGBO(255, 255, 255, 1);

  static const Color gradient1 = Color.fromRGBO(245, 134, 0, 1);
  static const Color gradient2 = Color.fromRGBO(198, 66, 22, 1);
  static const Color buttonColor = Color.fromRGBO(234, 118, 5, 1);
  static const Color gradient3 = Color.fromRGBO(245, 75, 0, 1);
  static const Color borderGradient1 = Color.fromRGBO(245, 75, 1, 1);
  static const Color borderGradient2 = Color.fromRGBO(246, 138, 1, 0);

  static final TextStyle appbarText = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: AppPalette.kWhite, fontSize: 18, fontWeight: FontWeight.w600));
  static final TextStyle crPollText = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: AppPalette.kGrey));

  static const BoxDecoration containerBorder = BoxDecoration(
    color: Color.fromARGB(255, 42, 40, 40),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
}
