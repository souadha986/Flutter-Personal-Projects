import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/core/styling/app_colors.dart';
import 'package:shopping/core/styling/app_styles.dart';

// ignore: must_be_immutable
class Bottoms extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? textstyle;
  final String? title;
  final Color? backgroundcolor;

  void Function() onPress;
  Bottoms({
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
        // ignore: deprecated_member_use
        shadowColor: AppColors.blackColor.withOpacity(0.25),
        backgroundColor: backgroundcolor ?? AppColors.redColor,
        fixedSize: Size(width ?? 343.w, height ?? 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 12.r),
        ),
      ),
      child: Text(
        title ?? "",
        style:
            textstyle ??
            AppStyles.black14medium.copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
