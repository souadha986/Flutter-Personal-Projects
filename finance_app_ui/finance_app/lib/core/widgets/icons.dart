import 'package:finance_app/core/assets/images.dart';
import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:finance_app/core/widgets/oneicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogInIcon extends StatelessWidget {
  String title;
  LogInIcon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(thickness: 1, color: AppColors.devidercolor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                title,
                style: Fontstyle.thirdlyfontstyle.copyWith(
                  fontSize: 14.sp,
                  color: Color(0xFF6A707C),
                ),
              ),
            ),

            Expanded(
              child: Divider(thickness: 1, color: AppColors.devidercolor),
            ),
          ],
        ),
        SizedBox(height: 22.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Oneicon(iconPath: Images.facebook, onTapp: () {}),
            Oneicon(iconPath: Images.google, onTapp: () {}),
            Oneicon(iconPath: Images.apple, onTapp: () {}),
          ],
        ),
      ],
    );
  }
}
