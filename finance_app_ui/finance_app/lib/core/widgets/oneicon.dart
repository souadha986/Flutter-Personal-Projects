import 'package:finance_app/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Oneicon extends StatelessWidget {
  void Function() onTapp;
  String iconPath;

  Oneicon({super.key, required this.iconPath, required this.onTapp});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapp,
      child: Container(
        height: 56.h,
        width: 105.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.devidercolor, width: 1),
        ),
        child: Center(
          child: SvgPicture.asset(iconPath, height: 24.h, width: 12.w),
        ),
      ),
    );
  }
}
