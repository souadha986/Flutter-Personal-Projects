import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/app_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Fontstyle {
  static TextStyle primaryfontstyle = TextStyle(
    fontFamily: AppFonts.mainFontNAme,
    fontWeight: FontWeight.w700,
    fontSize: 30.sp,
    color: AppColors.primaryColor,
  );
  static TextStyle secondaryfontstyle = TextStyle(
    fontFamily: AppFonts.mainFontNAme,
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
    color: AppColors.whiteColor,
  );
  static TextStyle secondaryfontstylegrey = TextStyle(
    fontFamily: AppFonts.mainFontNAme,
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
    color: AppColors.secondaryColor,
  );
  static TextStyle secondaryfontstylepurple = TextStyle(
    fontFamily: AppFonts.mainFontNAme,
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
    color: AppColors.primaryColor,
  );
  static TextStyle thirdlyfontstyle = TextStyle(
    fontFamily: AppFonts.mainFontNAme,
    fontWeight: FontWeight.w600,
    fontSize: 15.sp,
    color: AppColors.whiteColor,
  );
  static TextStyle blackboldW700 = TextStyle(
    fontFamily: AppFonts.mainFontNAme,
    fontWeight: FontWeight.w700,
    fontSize: 15.sp,
    color: Color(0xFF202955),
  );
}
