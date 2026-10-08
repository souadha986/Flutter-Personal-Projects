import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/core/styling/app_colors.dart';
import 'package:shopping/core/styling/app_styles.dart';
import 'package:shopping/core/widgets/bottoms.dart';
import 'package:shopping/core/widgets/spacing.dart';
import 'package:shopping/core/widgets/text_field.dart';

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
          appBar: AppBar(
            toolbarHeight: 88.h,
            backgroundColor: AppColors.backgroundcolor,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login", style: AppStyles.black34bold),

                    const HeightSpace(73),

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
                        onPressed: () {},
                        child: Text(
                          "Forget Password?",
                          style: AppStyles.black14medium,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Bottoms(
                      onPress: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      title: "login",
                    ),
                    const HeightSpace(194),
                    Text(
                      "Or Login whith social account",
                      style: AppStyles.black14medium,
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
