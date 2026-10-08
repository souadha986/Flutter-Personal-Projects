import 'package:finance_app/core/styling/font_style.dart';
import 'package:finance_app/core/widgets/back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRow extends StatelessWidget {
  const AppRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Image.network(
            fit: BoxFit.cover,
            height: 48.h,
            width: 48.w,
            "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",
          ),
        ),
        Column(
          children: [
            Text("Welcome Back", style: Fontstyle.secondaryfontstylegrey),
            Text(
              "Johnyyy  Depp",
              style: Fontstyle.blackboldW700.copyWith(fontSize: 18.sp),
            ),
          ],
        ),
        SizedBox(width: 68.w),
        Back(onPresse: () {}),
      ],
    );
  }
}
