import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isselected;
  const CategoryItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isselected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        alignment: Alignment.center,
        height: 22.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: isselected ? AppColors.blueColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: BoxBorder.all(
            color: isselected ? AppColors.blueColor : Color(0xFFE9EEFA),
            width: 1,
          ),
        ),
        child: Text(
          title,
          style: isselected
              ? AppStyles.black16w500.copyWith(color: AppColors.whiteColor)
              : AppStyles.black16w500,
        ),
      ),
    );
  }
}
