import 'package:finance_app/core/navigation/app_routes.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:finance_app/core/widgets/back.dart';
import 'package:finance_app/core/widgets/buttoms.dart';
import 'package:finance_app/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController passwordcontroller;
  late TextEditingController confirmepasswordcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordcontroller = TextEditingController();
    confirmepasswordcontroller = TextEditingController();
  }

  @override
  void dispose() {
    passwordcontroller.dispose();
    confirmepasswordcontroller.dispose();

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
                    width: 300.w,
                    child: Text(
                      "Create new password",
                      style: Fontstyle.primaryfontstyle,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Your new password must be unique from those previously used.",
                      style: Fontstyle.secondaryfontstyle.copyWith(
                        color: Color(0xFF8391A1),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),

                  Fields(
                    title: "New password",
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

                  SizedBox(height: 15.h),

                  Fields(
                    title: "Confirm Password",
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
                  SizedBox(height: 38.h),
                  Buttoms(
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(context).pushNamed(AppRoute.passwordchange);
                      }
                    },
                    title: "Reset Password",
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
