import 'package:finance_app/core/styling/app_colors.dart';
import 'package:finance_app/core/styling/font_style.dart';
import 'package:finance_app/my_pages/home/home.dart';
import 'package:finance_app/my_pages/statistics/stat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selecteditem = 0;
  List<Widget> screens = [
    Home(),
    BarChartSample2(),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[selecteditem],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selecteditem,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() {
              selecteditem = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.sp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_history, size: 30.sp),
              label: "Statistics",
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 48.sp,
                height: 48.sp,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(Icons.add, color: Colors.white, size: 30.sp),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership_outlined, size: 30.sp),
              label: "My Card",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30.sp),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
