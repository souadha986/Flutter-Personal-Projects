import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCart extends StatelessWidget {
  final void Function()? onTap;
  final String? imageUrl;
  final String itemname;
  final String price;
  const ItemCart({
    super.key,
    required this.itemname,
    required this.price,
    required this.onTap,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 161.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Hero(
                tag: itemname,
                child: CachedNetworkImage(
                  imageUrl:
                      imageUrl ??
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNmNzos6rZdKhj3YO_NgWUADhVuFpYLE0Hog&s",
                  height: 174.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNmNzos6rZdKhj3YO_NgWUADhVuFpYLE0Hog&s",
                  ),
                ),
              ),
            ),
            const HeightSpace(8),
            Text(itemname, style: AppStyles.black16w600, maxLines: 1),
            const HeightSpace(3),
            Text(
              maxLines: 1,
              price,
              style: AppStyles.grey16w4008.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
