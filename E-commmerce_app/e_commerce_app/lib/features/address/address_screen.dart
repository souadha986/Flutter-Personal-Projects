import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:e_commerce_app/features/address/widgets/adrees_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.h,
        title: Text("Address", style: AppStyles.black24w600),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: 0.3),
            const HeightSpace(18),
            Text("Saved Adrees", style: AppStyles.black16w600),
            const HeightSpace(18),
            AddressItem(address: "Home", addressDetails: "Oran,3000logements"),
            AddressItem(address: "Home", addressDetails: "Oran,3000logements"),
            AddressItem(address: "Home", addressDetails: "Oran,3000logements"),
          ],
        ),
      ),
    );
  }
}
