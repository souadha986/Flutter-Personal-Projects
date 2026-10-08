import 'package:e_commerce_app/core/styling/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle black32w600 = GoogleFonts.readexPro(
    textStyle: TextStyle(
      fontSize: 32.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
    ),
  );
  static TextStyle black24w600dmsans = GoogleFonts.dmSans(
    textStyle: TextStyle(
      fontSize: 24.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
    ),
  );
  static TextStyle black24w600 = GoogleFonts.readexPro(
    textStyle: TextStyle(
      fontSize: 24.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
    ),
  );
  static TextStyle black16w600 = GoogleFonts.readexPro(
    textStyle: TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
    ),
  );
  static TextStyle grey16w4009 = GoogleFonts.readexPro(
    textStyle: TextStyle(
      fontSize: 16.sp,
      color: AppColors.greyColor9,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextStyle grey16w4008 = GoogleFonts.readexPro(
    textStyle: TextStyle(
      fontSize: 16.sp,
      color: AppColors.greyColor8,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextStyle black16w400 = GoogleFonts.readexPro(
    textStyle: TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextStyle white14w500 = GoogleFonts.readexPro(
    textStyle: TextStyle(
      fontSize: 16.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextStyle black16w500 = GoogleFonts.readexPro(
    textStyle: TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500,
    ),
  );
}
