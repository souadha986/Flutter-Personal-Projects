import 'package:finance_app/core/navigation/app_routes.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:finance_app/core/widgets/back.dart';
import 'package:finance_app/core/widgets/buttoms.dart';
import 'package:finance_app/core/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
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
                      "Forget Password ",
                      style: Fontstyle.primaryfontstyle,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Dont worry! it occurs.Please enter the email address linked whith your account ",
                      style: Fontstyle.secondaryfontstyle.copyWith(
                        color: Color(0xFF8391A1),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),

                  Fields(
                    title: "Enter your E-mail",
                    isPassword: false,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("enter your email");
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 38.h),
                  Buttoms(
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRoute.otpverification);
                      }
                    },
                    title: "Send Code",
                  ),
                  SizedBox(height: 361.h),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Remember Password?",
                        style: Fontstyle.secondaryfontstylepurple,
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRoute.login);
                              },
                            text: "Login",
                            style: Fontstyle.blackboldW700.copyWith(
                              color: Color(0xFF202955),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
