import 'package:finance_app/core/navigation/app_routes.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:finance_app/core/widgets/back.dart';
import 'package:finance_app/core/widgets/buttoms.dart';
import 'package:finance_app/core/widgets/icons.dart';
import 'package:finance_app/core/widgets/text_field.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: SafeArea(
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
                      width: 280.w,
                      child: Text(
                        "Welcome Back! Again! ",
                        style: Fontstyle.primaryfontstyle,
                      ),
                    ),
                    SizedBox(height: 50.h),

                    Fields(
                      title: "Enter your E-mail",
                      isPassword: false,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    Fields(
                      title: "Enter your Password",
                      isPassword: true,
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Password";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                        return null;
                      },
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          overlayColor: (Colors.transparent),
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          context.pushNamed(AppRoute.forgetpassword);
                        },
                        child: Text(
                          "Forget Password?",
                          style: Fontstyle.thirdlyfontstyle.copyWith(
                            color: Color(0xFF6A707C),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Buttoms(
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          GoRouter.of(context).pushNamed(AppRoute.mainscreen);
                        }
                      },
                      title: "login",
                    ),
                    SizedBox(height: 30.h),
                    LogInIcon(title: "Or Login with"),
                    SizedBox(height: 155.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "D'ont have an account?",
                          style: Fontstyle.secondaryfontstylepurple,
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushNamed(AppRoute.register);
                                },
                              text: "Register now",
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
      ),
    );
  }
}
