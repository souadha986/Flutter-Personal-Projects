import 'package:finance_app/core/navigation/app_routes.dart';
import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:finance_app/core/widgets/back.dart';
import 'package:finance_app/core/widgets/buttoms.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController codeController;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 56.h),
                  Back(
                    onPresse: () {
                      context.pop();
                    },
                  ),
                  SizedBox(height: 28.h),
                  SizedBox(
                    width: 234.w,
                    child: Text(
                      "OTP Verification ",
                      style: Fontstyle.primaryfontstyle,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Enter the verification code we just sent on your email address. ",
                      style: Fontstyle.secondaryfontstyle.copyWith(
                        color: Color(0xFF8391A1),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  PinCodeTextField(
                    textStyle: Fontstyle.primaryfontstyle.copyWith(
                      fontSize: 22.sp,
                    ),
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 4,
                    controller: codeController,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 60.h,
                      fieldWidth: 70.w,
                      borderRadius: BorderRadius.circular(8.r),
                      selectedColor: AppColors.primaryColor,
                      activeColor: AppColors.primaryColor,
                      // ignore: deprecated_member_use
                      inactiveColor: AppColors.secondaryColor.withOpacity(0.2),
                    ),
                  ),
                  SizedBox(height: 38.h),
                  Buttoms(
                    onPress: () {
                      GoRouter.of(
                        context,
                      ).pushNamed(AppRoute.createnewpassword);
                    },
                    title: "Verify",
                  ),
                  SizedBox(height: 300.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Didn't receive code?",
                        style: Fontstyle.secondaryfontstylepurple,
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRoute.forgetpassword);
                              },
                            text: "Resent",
                            style: Fontstyle.blackboldW700.copyWith(
                              color: Color(0xFF202955),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
