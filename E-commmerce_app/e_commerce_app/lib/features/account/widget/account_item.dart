import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountItem extends StatelessWidget {
  final String imageassets;
  final void Function()? onTap;
  final String title;
  const AccountItem({
    required this.onTap,
    super.key,
    required this.imageassets,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            Image.asset(imageassets, height: 24.sp, width: 24.sp),
            const WidthSpace(16),
            Text(title, style: AppStyles.black16w400),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              size: 26.sp,
              color: AppColors.greyColor8,
            ),
          ],
        ),
      ),
    );
  }
}
