import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {

  static TextStyle textStyle20 = GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );


  static TextStyle textStyle18 = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle textStyle14 = GoogleFonts.montserrat(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black38,
      height: 0.7.h);
}
