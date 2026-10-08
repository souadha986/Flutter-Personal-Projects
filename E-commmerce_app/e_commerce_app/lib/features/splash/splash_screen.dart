import 'package:e_commerce_app/core/Assets/app_assets.dart';
import 'package:e_commerce_app/core/navigation/app_routes.dart';
import 'package:e_commerce_app/core/utils/secure_storage.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';

import 'dart:async';

import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1, milliseconds: 50),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.repeat(reverse: true);
    navigation();
  }

  navigation() async {
    await Future.delayed(Duration(seconds: 3));
    sl<SecureStorage>().getToken().then((value) {
      if (value != null && value.isNotEmpty) {
        context.pushNamed(AppRoutes.mainscreen);
      } else {
        context.pushNamed(AppRoutes.login);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(AppAssets.ecommerce, height: 250.h, width: 250.w),
        ),
      ),
    );
  }
}
