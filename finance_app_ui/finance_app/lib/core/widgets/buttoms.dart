import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttoms extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? textstyle;
  final String? title;
  final Color? backgroundcolor;

  void Function() onPress;
  Buttoms({
    super.key,
    this.title,
    this.backgroundcolor,
    this.height,
    this.width,
    this.radius,
    this.textstyle,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundcolor ?? AppColors.primaryColor,
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 8.r),
        ),
      ),
      child: Text(
        title ?? "",
        style: textstyle ?? Fontstyle.secondaryfontstyle,
      ),
    );
  }
}
