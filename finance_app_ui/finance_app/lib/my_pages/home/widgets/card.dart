import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 207.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.primaryColor, width: 2),
          ),
        ),
        Positioned(
          child: Image.asset(
            "assets/images/Ellipse.png",
            width: 277.w,
            height: 277.h,
            fit: BoxFit.fill,
          ),
          right: 9.w,
          top: 62.h,
        ),
        Positioned(
          child: Image.asset(
            "assets/images/Ellipse.png",
            width: 277.w,
            height: 277.h,
            fit: BoxFit.fill,
          ),
          right: 9.w,
          top: 62.h,
        ),
        Positioned(
          child: Image.asset(
            "assets/images/Ellipse.png",
            width: 153.w,
            height: 153.h,
            fit: BoxFit.fill,
          ),
          right: 71.w,
          top: 124.h,
        ),
        Positioned(
          left: 24.w,
          top: 24.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "X_Card",
                style: Fontstyle.primaryfontstyle.copyWith(
                  color: Color(0xFFFDFDFD),
                  fontSize: 12.sp,
                ),
              ),

              SizedBox(height: 57.h),

              Text(
                "Balance",
                style: Fontstyle.secondaryfontstylegrey.copyWith(
                  color: Color(0xEEFDFDFD).withOpacity(0.4),
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                "240007EG",
                style: Fontstyle.blackboldW700.copyWith(
                  color: Colors.white,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 60.h),
              Row(
                children: [
                  Text(
                    "****  3434",
                    style: Fontstyle.secondaryfontstylegrey.copyWith(
                      color: Color(0xEEFDFDFD).withOpacity(0.4),
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(width: 60.w),
                  Text(
                    "12/24",
                    style: Fontstyle.secondaryfontstylegrey.copyWith(
                      color: Color(0xFFFDFDFD),
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
