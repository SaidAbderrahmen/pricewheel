import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pricewheel/consts/colors.dart';

class AppTextStyle {
  static TextStyle headerText = GoogleFonts.plusJakartaSans(
    fontSize: 30.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textColor,
  );
   static TextStyle descText = GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.secendaryTextColor,
  );
  static TextStyle buttonText = GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.teritaryColor,
  );
  static TextStyle infoText = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.infoColor,
  );


}
