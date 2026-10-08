import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlineButtomApp extends StatelessWidget {
  double? width;
  double? height;
  double? radius;
  TextStyle? textstyle;
  String? title;
  Color? bordercolor;
  Color? textColor;
  void Function() onPress;
  OutlineButtomApp({
    super.key,
    this.title,
    this.bordercolor,
    this.textColor,
    this.height,
    this.width,
    this.radius,
    this.textstyle,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: bordercolor ?? AppColors.primaryColor),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 8.r),
        ),
      ),
      child: Text(
        title!,
        style: textstyle ?? Fontstyle.secondaryfontstylepurple,
      ),
    );
  }
}
