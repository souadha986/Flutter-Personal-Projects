import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttons extends StatelessWidget {
  final double? width;
  final Widget? icon;
  final Widget? trailingIcon;
  final double? height;
  final double? radius;
  final TextStyle? textstyle;
  final String? title;
  final Color? backgroundcolor;
  final bool isloading;

  final void Function() onPress;
  const Buttons({
    this.isloading = false,
    this.icon,
    this.trailingIcon,
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
        backgroundColor: backgroundcolor ?? AppColors.blueColor,
        fixedSize: Size(width ?? 325.w, height ?? 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
      ),
      child: isloading
          ? Center(
              child: SizedBox(
                height: 20.w,
                width: 20.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.whiteColor,
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[icon!, const WidthSpace(8)],
                Text(title ?? "", style: textstyle ?? AppStyles.white14w500),
                if (trailingIcon != null) ...[
                  const WidthSpace(8),
                  trailingIcon!,
                ],
              ],
            ),
    );
  }
}
