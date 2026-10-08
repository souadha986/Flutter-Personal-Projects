import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressItem extends StatelessWidget {
  final String address;
  final String addressDetails;
  const AddressItem({
    super.key,
    required this.address,
    required this.addressDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.w),
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 40.w, vertical: 16.h),
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Color(0xFFE6E6E6), width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: AppColors.greyColor8,
              size: 32.sp,
            ),
            const WidthSpace(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.black16w600.copyWith(fontSize: 14.sp),
                  ),
                ),
                const HeightSpace(8),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    addressDetails,
                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.grey16w4008.copyWith(fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
