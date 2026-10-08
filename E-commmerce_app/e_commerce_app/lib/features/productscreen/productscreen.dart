import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/utils/snack_bar.dart';
import 'package:e_commerce_app/core/widgets/buttoms.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/cubit/cubit_states.dart';
import 'package:e_commerce_app/features/homescreen/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Productscreen extends StatelessWidget {
  final Products product;
  const Productscreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.h,
        title: Text("Details", style: AppStyles.black24w600),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 105.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpace(20),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10.r),
                    child: Hero(
                      tag: product.title!,
                      child: CachedNetworkImage(
                        imageUrl:
                            product.image ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNmNzos6rZdKhj3YO_NgWUADhVuFpYLE0Hog&s",
                        height: 369.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) => Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNmNzos6rZdKhj3YO_NgWUADhVuFpYLE0Hog&s",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    product.title ?? "No name",
                    style: AppStyles.black24w600dmsans,
                  ),
                  const HeightSpace(8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 18.sp),
                      const WidthSpace(2),
                      Text(
                        "${product.rating?.rate}/5",
                        style: AppStyles.black16w500.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const WidthSpace(2),
                      Text(
                        "(${product.rating?.count} Reviews )",
                        style: AppStyles.grey16w4008.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  const HeightSpace(13),
                  Text(
                    product.description ?? "No description",
                    style: AppStyles.grey16w4008,
                  ),
                  const HeightSpace(13),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              width: double.infinity,

              height: 105.h,
              decoration: BoxDecoration(
                border: Border.all(width: 0.1, color: AppColors.greyColor8),
                color: AppColors.whiteColor,
              ),
              padding: EdgeInsets.fromLTRB(25.w, 20.h, 25.w, 5.h),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price", style: AppStyles.grey16w4008),
                      Text("${product.price}£", style: AppStyles.black24w600),
                    ],
                  ),
                  const WidthSpace(20),
                  Expanded(
                    child: BlocConsumer<CartCubit, CubitStates>(
                      listener: (context, state) {
                        if (state is Cartaddingsuccessstate) {
                          ShowSnackBar.showAnimatedSnackDialog(
                            context: context,
                            message: "Success,product is now in your cart",
                            type: AnimatedSnackBarType.success,
                          );
                        }
                        if (state is Cartaddingerrorstate) {
                          ShowSnackBar.showAnimatedSnackDialog(
                            context: context,
                            message: state.error,
                            type: AnimatedSnackBarType.error,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is Cartloadingstate) {
                          return Buttons(isloading: true, onPress: () {});
                        }
                        return Buttons(
                          onPress: () {
                            context.read<CartCubit>().addtocart(
                              product: product,
                              quantity: 1,
                            );
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                          height: 54.h,
                          width: 240.w,
                          title: "Add to cart",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
