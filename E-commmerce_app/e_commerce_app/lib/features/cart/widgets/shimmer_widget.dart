import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      width: double.infinity,
      decoration: BoxDecoration(
        // 👈 add base color for parent
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(14.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼 Product image
          Container(width: 80.w, height: 80.w, color: Colors.grey[300]),
          const WidthSpace(16),
          // 📄 Text info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + small badge/price on right
                Row(
                  children: [
                    Container(
                      height: 14.h,
                      width: 128.w,
                      color: Colors.grey[300],
                    ),
                    const Spacer(),
                    Container(
                      height: 16.h,
                      width: 16.w,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                const HeightSpace(10),
                // Subtitle
                Container(height: 17.h, width: 35.w, color: Colors.grey[300]),
                const HeightSpace(16),
                // Price + quantity controls
                Row(
                  children: [
                    Container(
                      height: 20.h,
                      width: 50.w,
                      color: Colors.grey[300],
                    ),
                    const Spacer(),
                    // minus btn
                    Container(
                      width: 23.w,
                      height: 22.w,
                      color: Colors.grey[300],
                    ),
                    const WidthSpace(12),
                    Container(
                      height: 17.h,
                      width: 10.w,
                      color: Colors.grey[300],
                    ),
                    const WidthSpace(12),
                    // plus btn
                    Container(
                      width: 23.w,
                      height: 22.w,
                      color: Colors.grey[300],
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
