import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/account/account_screen.dart';
import 'package:e_commerce_app/features/auth/cubit/authcubit.dart';
import 'package:e_commerce_app/features/cart/cartscreen.dart';
import 'package:e_commerce_app/features/homescreen/cubit/categoriescubit/categories_cubit.dart';
import 'package:e_commerce_app/features/homescreen/cubit/productcubit/product_cubit.dart';
import 'package:e_commerce_app/features/homescreen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  final List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(sl()),
        ),
        BlocProvider<ProductCubit>(create: (context) => ProductCubit(sl())),
      ],
      child: Home(),
    ),
    Cartscreen(),
    BlocProvider(create: (context) => AuthCubit(sl()), child: AccountScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        elevation: 1,
        backgroundColor: AppColors.whiteColor,
        selectedLabelStyle: AppStyles.black16w500.copyWith(fontSize: 12.sp),
        unselectedLabelStyle: AppStyles.black16w500.copyWith(fontSize: 12.sp),
        selectedItemColor: AppColors.blueColor,
        unselectedItemColor: AppColors.greyColor9,
        iconSize: 26.sp, // reduce icon size to minimize spacing
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
