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

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController usernamecontroller;
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  late TextEditingController confirmepasswordcontroller;
  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    usernamecontroller = TextEditingController();
    confirmepasswordcontroller = TextEditingController();
  }

  void dispose() {
    usernamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmepasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
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
                    width: 331.w,
                    child: Text(
                      " Hello! Register to get started ",
                      style: Fontstyle.primaryfontstyle,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  Fields(
                    title: "Username",
                    isPassword: false,
                    controller: usernamecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Username";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12.h),
                  Fields(
                    title: "Email",
                    isPassword: false,
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12.h),
                  Fields(
                    title: "Password",
                    isPassword: false,
                    controller: passwordcontroller,
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
                  SizedBox(height: 12.h),
                  Fields(
                    title: "Confirm password",
                    isPassword: false,
                    controller: confirmepasswordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Confirm Password";
                      }
                      if (value != passwordcontroller.text) {
                        return "Passwords are not equal";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.h),
                  Buttoms(
                    onPress: () {
                      //if (formKey.currentState!.validate()) {
                      //  GoRouter.of(context).pushNamed(AppRoute.onboarding);
                      //}
                    },
                    title: "Register",
                  ),
                  SizedBox(height: 35.h),
                  LogInIcon(title: "Or Register with"),
                  SizedBox(height: 54.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "already have an account?",
                        style: Fontstyle.secondaryfontstylepurple,
                        children: [
                          TextSpan(
                            text: "Login now",
                            style: Fontstyle.blackboldW700.copyWith(
                              color: Color(0xFF202955),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRoute.login);
                              },
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
