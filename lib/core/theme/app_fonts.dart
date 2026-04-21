import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static const primary = 'Plus Jakarta Sans';

  static TextTheme textTheme(TextTheme base) {
    return GoogleFonts.plusJakartaSansTextTheme(base);
  }
}
