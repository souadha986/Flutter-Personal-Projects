import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String size;
  final double price;

  const CartItem({
    super.key,
    this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 9.h),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: AppColors.greyColor8),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(14.r),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.network(
              imageUrl ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNmNzos6rZdKhj3YO_NgWUADhVuFpYLE0Hog&s",
              width: 83.w,
              height: 79.h,
              fit: BoxFit.cover,
            ),
          ),
          const WidthSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppStyles.black16w600.copyWith(fontSize: 14.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.delete, color: Colors.red, size: 17.sp),
                  ],
                ),
                Text(
                  "Size $size",
                  style: AppStyles.grey16w4008.copyWith(fontSize: 14.sp),
                ),
                const HeightSpace(21),
                Row(
                  children: [
                    Text(
                      "$price Da",
                      style: AppStyles.black16w600.copyWith(fontSize: 14.sp),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: 23.w,
                      height: 23.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        border: Border.all(
                          width: 0.1,
                          color: AppColors.greyColor8,
                        ),
                      ),
                      child: const Icon(Icons.remove, size: 16),
                    ),
                    const WidthSpace(9),
                    Text(
                      "0",
                      style: AppStyles.black16w500.copyWith(fontSize: 12.sp),
                    ),
                    const WidthSpace(9),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        width: 23.w,
                        height: 23.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(
                            width: 0.1,
                            color: AppColors.greyColor8,
                          ),
                        ),
                        child: const Icon(Icons.add, size: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
