import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/core/navigation/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';

import 'package:e_commerce_app/core/utils/snack_bar.dart';
import 'package:e_commerce_app/core/widgets/buttoms.dart';
import 'package:e_commerce_app/core/widgets/loading.dart';
import 'package:e_commerce_app/core/widgets/spacing.dart';
import 'package:e_commerce_app/core/widgets/text_field.dart';
import 'package:e_commerce_app/features/auth/cubit/authcubit.dart';
import 'package:e_commerce_app/features/auth/cubit/authstates.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<AuthCubit, Authstates>(
          listener: (context, state) {
            if (state is Errorstate) {
              ShowSnackBar.showAnimatedSnackDialog(
                context: context,
                message: state.error,
                type: AnimatedSnackBarType.error,
              );
            }
            if (state is Successstate) {
              ShowSnackBar.showAnimatedSnackDialog(
                context: context,
                message: state.success,
                type: AnimatedSnackBarType.success,
              );

              GoRouter.of(context).pushNamed(AppRoutes.mainscreen);
            }
          },
          builder: (context, state) {
            if (state is Loadingstate) {
              return const Loading();
            }

            return Padding(
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
                          Text(
                            "Login To Your Account",
                            style: AppStyles.black32w600,
                          ),
                          const HeightSpace(8),
                          Text(
                            "It's great to see you again",
                            style: AppStyles.grey16w4008,
                          ),
                          const HeightSpace(32),
                          Text("User Name", style: AppStyles.black16w500),
                          const HeightSpace(8),
                          Fields(
                            isPassword: false,
                            controller: username,
                            title: "Enter Your User Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your User Name";
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
                              if (value.length < 3) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                          ),
                          const HeightSpace(55),
                          Buttons(
                            title: "Sign in",
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthCubit>().login(
                                  username.text,
                                  password.text,
                                );
                              }
                            },
                          ),
                          const Spacer(),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account?",
                                style: AppStyles.grey16w4009,
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushNamed(AppRoutes.register);
                                      },
                                    text: " Register now",
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
            );
          },
        ),
      ),
    );
  }
}
