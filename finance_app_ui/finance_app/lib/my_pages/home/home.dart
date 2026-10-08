import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/my_pages/home/widgets/approw.dart';
import 'package:finance_app/my_pages/home/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int currentindex = 0;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          SizedBox(height: 31.h),
          AppRow(),
          SizedBox(height: 21.h),
          CarouselSlider(
            options: CarouselOptions(
              height: 263.h,
              padEnds: false,
              viewportFraction: 0.7,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              onPageChanged: (index, reason) {
                setState(() {
                  currentindex = index;
                });
              },
            ),

            items: [MyCard(), MyCard(), MyCard(), MyCard()],
          ),
          SizedBox(height: 8.h),
          DotsIndicator(
            dotsCount: 4,
            position: currentindex.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.sp,
                crossAxisSpacing: 16.sp,
              ),
              children: [
                Container(color: AppColors.primaryColor),
                Container(color: AppColors.primaryColor),
                Container(color: AppColors.primaryColor),
                Container(color: AppColors.primaryColor),
                Container(color: AppColors.primaryColor),
                Container(color: AppColors.primaryColor),
                Container(color: AppColors.primaryColor),
                Container(color: AppColors.primaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
