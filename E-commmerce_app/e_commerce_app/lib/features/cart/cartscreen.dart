import 'dart:developer';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/buttoms.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/cubit/cubit_states.dart';
import 'package:e_commerce_app/features/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/features/cart/widgets/shimmer_widget.dart';
import 'package:e_commerce_app/features/cart/widgets/title_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});
  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().fetchcarts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.h,
        title: Text("MyCart", style: AppStyles.black24w600),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<CartCubit, CubitStates>(
        builder: (context, state) {
          if (state is Cartloadingstate) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[350]!,
              highlightColor: Colors.grey[200]!,

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.33,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 250.h),
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return ShimmerWidget();
                        },
                      ),
                    ),

                    const HeightSpace(100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 22.h,
                          width: 71.w,
                          color: Colors.grey[300],
                        ),
                        Container(
                          height: 22.h,
                          width: 57.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    const HeightSpace(16),

                    // VAT
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 22.h,
                          width: 60.w,
                          color: Colors.grey[300],
                        ),
                        Container(
                          height: 22.h,
                          width: 57.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    const HeightSpace(16),

                    // Shipping
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 22.h,
                          width: 98.w,
                          color: Colors.grey[300],
                        ),
                        Container(
                          height: 22.h,
                          width: 57.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),

                    const HeightSpace(16),
                    Divider(color: Colors.grey[300], thickness: 1),
                    const HeightSpace(16),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 22.h,
                          width: 37.w,
                          color: Colors.grey[300],
                        ),
                        Container(
                          height: 22.h,
                          width: 57.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    const HeightSpace(51),
                    Container(
                      height: 54.h,

                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is Cartsuccessstate) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 250.h),
                    itemCount: state.cart.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartItem(
                        title: '${state.cart.products[index].productId}',
                        size: 'L',
                        price: 1.099,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 26.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitlePrice(title: "Sub Total", price: "1190 \$"),
                        TitlePrice(title: "VAT (16 %)", price: "1190 \$"),
                        TitlePrice(title: "Shipping Fees", price: "1190 \$"),
                        const HeightSpace(20),
                        const Divider(),
                        const HeightSpace(20),
                        TotalPriceWidget(title: "Total", price: "1190 \$"),
                        const HeightSpace(20),
                        Buttons(
                          title: "Go To Checkout",
                          trailingIcon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                          onPress: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          if (state is Carterrorstate) {
            log(state.error);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
