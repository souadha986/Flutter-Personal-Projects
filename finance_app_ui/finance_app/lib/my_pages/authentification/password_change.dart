import 'package:finance_app/core/styling/font_style.dart';
import 'package:finance_app/core/widgets/buttoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordChange extends StatelessWidget {
  const PasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 248.h),
                  Image.asset(
                    "assets/images/Successmark.png",
                    width: 100.w,
                    height: 100.h,
                  ),
                  SizedBox(height: 35.h),
                  SizedBox(
                    width: 234.w,
                    child: Text(
                      "Password Changed!",
                      style: Fontstyle.primaryfontstyle.copyWith(
                        fontSize: 26.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 230.w,
                    child: Text(
                      "Your Password has been changed \n seccessfully",
                      textAlign: TextAlign.center,
                      style: Fontstyle.secondaryfontstyle.copyWith(
                        color: Color(0xFF8391A1),
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Buttoms(onPress: () {}, title: "Login"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
