import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/Assets/app_assets.dart';
import 'package:e_commerce_app/core/navigation/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/buttoms.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:e_commerce_app/features/account/widget/account_item.dart';
import 'package:e_commerce_app/features/auth/cubit/authcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 85.h,
        title: Text("Account", style: AppStyles.black24w600),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Divider(thickness: 0.3),
          ),
          const HeightSpace(18),
          AccountItem(
            title: "My Orders",
            imageassets: AppAssets.box,
            onTap: () {},
          ),
          const HeightSpace(25),
          Padding(
            padding: EdgeInsetsGeometry.zero,
            child: Divider(thickness: 8.sp, color: Color(0xFFAAAAAA)),
          ),
          const HeightSpace(25),
          AccountItem(
            title: "My Details",
            imageassets: AppAssets.details,
            onTap: () {},
          ),
          const HeightSpace(18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Divider(thickness: 0.3),
          ),
          const HeightSpace(18),
          AccountItem(
            title: "Address Book",
            imageassets: AppAssets.address,
            onTap: () {
              context.push(AppRoutes.address);
            },
          ),
          const HeightSpace(18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Divider(thickness: 0.3),
          ),
          const HeightSpace(18),
          AccountItem(
            title: "FAQs",
            imageassets: AppAssets.question,
            onTap: () {},
          ),
          const HeightSpace(18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Divider(thickness: 0.3),
          ),
          const HeightSpace(18),
          AccountItem(
            title: "Help Center",
            imageassets: AppAssets.headphones,
            onTap: () {},
          ),
          const HeightSpace(25),
          Padding(
            padding: EdgeInsetsGeometry.zero,
            child: Divider(thickness: 8.sp, color: Color(0xFFE6E6E6)),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              onTap: () {
                showlogoutdialog(parentcontext: context);
              },
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.redAccent, size: 25.sp),
                  const WidthSpace(8),

                  Text(
                    "Logout",
                    style: AppStyles.black16w400.copyWith(
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const HeightSpace(75),
        ],
      ),
    );
  }

  showlogoutdialog({required BuildContext parentcontext}) {
    return showDialog(
      context: parentcontext,
      builder: (context) {
        return Dialog(
          child: Container(
            height: 400.h,
            color: AppColors.whiteColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeightSpace(24),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFEBEE),
                    ),
                    child: const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  const HeightSpace(20),
                  Text("Logout?", style: AppStyles.black24w600),
                  const HeightSpace(8),
                  Text(
                    "Are you sure you want to logout?",
                    style: AppStyles.grey16w4009,
                    textAlign: TextAlign.center,
                  ),
                  const HeightSpace(24),
                  Buttons(
                    onPress: () {
                      parentcontext.read<AuthCubit>().logout();
                      parentcontext.pushReplacement(AppRoutes.login);
                    },
                    backgroundcolor: Colors.red,
                    title: "Yes logout",
                  ),
                  const HeightSpace(12),
                  Buttons(
                    onPress: () {
                      parentcontext.pop();
                    },
                    backgroundcolor: Colors.green,
                    title: "No cancel",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
