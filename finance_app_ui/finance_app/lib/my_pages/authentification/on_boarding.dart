import 'package:finance_app/core/assets/images.dart';
import 'package:finance_app/core/navigation/app_routes.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:finance_app/core/widgets/buttoms.dart';
import 'package:finance_app/core/widgets/outline_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 570.h,
                  width: 375.w,
                  child: Image.asset(Images.board, fit: BoxFit.fill),
                ),
                SizedBox(height: 21.h),
                Buttoms(
                  title: "login",
                  onPress: () {
                    context.pushNamed(AppRoute.login);
                  },
                ),
                SizedBox(height: 15.h),
                OutlineButtomApp(
                  onPress: () {
                    context.pushNamed(AppRoute.register);
                  },
                  title: "Register",
                ),
                SizedBox(height: 46.h),
                //copywhith ùethode that override the classes of textstylewe have created
                Text(
                  "Continue as guest",
                  style: Fontstyle.blackboldW700.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
