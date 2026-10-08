import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitlePrice extends StatelessWidget {
  final String title;
  final String price;
  const TitlePrice({super.key, required this.price, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Text(title, style: AppStyles.grey16w4008),
          const Spacer(),
          Text(price, style: AppStyles.black16w500),
        ],
      ),
    );
  }
}

class TotalPriceWidget extends StatelessWidget {
  final String title;
  final String price;
  const TotalPriceWidget({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Text(title, style: AppStyles.black24w600.copyWith(fontSize: 16.sp)),
          const Spacer(),
          Text(price, style: AppStyles.black16w500),
        ],
      ),
    );
  }
}
