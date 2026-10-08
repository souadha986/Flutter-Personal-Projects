import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/buttoms.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:e_commerce_app/core/widgets/text_field.dart';
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
  late TextEditingController fullname;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController confirmpassword;
  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
    fullname = TextEditingController();
    confirmpassword = TextEditingController();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    fullname.dispose();
    confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeightSpace(28),
                      Text("Create an account", style: AppStyles.black32w600),
                      const HeightSpace(8),
                      Text(
                        "Let's create your account",
                        style: AppStyles.grey16w4008,
                      ),
                      const HeightSpace(32),
                      Text("Full name", style: AppStyles.black16w500),
                      const HeightSpace(8),
                      Fields(
                        isPassword: false,
                        controller: fullname,
                        title: "Enter Your full Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your full Name";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(16),
                      Text("Username", style: AppStyles.black16w500),
                      const HeightSpace(8),
                      Fields(
                        isPassword: false,
                        title: "Enter Your Username",
                        controller: username,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Username";
                          }

                          return null;
                        },
                      ),
                      const HeightSpace(16),
                      Text("Password", style: AppStyles.black16w500),
                      const HeightSpace(8),
                      Fields(
                        isPassword: true,
                        title: "Enter Your Password",
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
                      const HeightSpace(16),
                      Text("Confirm Password", style: AppStyles.black16w500),
                      const HeightSpace(8),
                      Fields(
                        isPassword: true,
                        title: "Confirm Your Password",
                        controller: confirmpassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm Your Password";
                          }
                          if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(55),
                      Buttons(
                        title: "Create Account",
                        onPress: () {
                          // if (formKey.currentState!.validate()) {
                          //   GoRouter.of(context).pushNamed(AppRoutes.verifyOtpScreen);
                          // }
                        },
                      ),
                      const Spacer(), // Works now with IntrinsicHeight
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "already have an account?",
                            style: AppStyles.grey16w4009,
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.pop();
                                  },
                                text: " login now",
                                style: AppStyles.black16w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const HeightSpace(16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
