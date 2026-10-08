import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/core/styling/app_colors.dart';
import 'package:shopping/core/styling/app_fonts.dart';

class AppStyles {
  static TextStyle black34bold = TextStyle(
    fontFamily: AppFonts.appfont,
    fontSize: 34.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle black16semibold = TextStyle(
    fontFamily: AppFonts.appfont,
    fontSize: 16.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle white34black = TextStyle(
    fontFamily: AppFonts.appfont,
    fontSize: 34.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w900,
  );
  static TextStyle black14medium = TextStyle(
    fontFamily: AppFonts.appfont,
    fontSize: 14.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle grey11regular = TextStyle(
    fontFamily: AppFonts.appfont,
    fontSize: 11.sp,
    color: AppColors.greyColor,
    fontWeight: FontWeight.w400,
  );
}
