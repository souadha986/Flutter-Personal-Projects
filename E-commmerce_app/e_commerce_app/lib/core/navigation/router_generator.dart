import 'package:e_commerce_app/core/navigation/app_routes.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/address/address_screen.dart';
import 'package:e_commerce_app/features/auth/cubit/authcubit.dart';
import 'package:e_commerce_app/features/auth/login.dart';
import 'package:e_commerce_app/features/auth/register.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/homescreen/models/product.dart';

import 'package:e_commerce_app/features/mainscreen/mainscreen.dart';
import 'package:e_commerce_app/features/productscreen/productscreen.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

class RouterGenerator {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: const Login(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.splashscreen,
        name: AppRoutes.splashscreen,
        builder: (context, state) => SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.register,
        name: AppRoutes.register,
        builder: (context, state) => Register(),
      ),

      GoRoute(
        path: AppRoutes.mainscreen,
        name: AppRoutes.mainscreen,
        builder: (context, state) => BlocProvider(
          create: (context) => CartCubit(sl()),
          child: MainScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.productdetails,
        name: AppRoutes.productdetails,
        builder: (context, state) {
          final product = state.extra as Products;
          return BlocProvider(
            create: (context) => CartCubit(sl()),
            child: Productscreen(product: product),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.address,
        name: AppRoutes.address,
        //if u want to add a transition affect to alll the pages u need to add this code in the main.dart
        //theme: ThemeData(
        // pageTransitionsTheme: const PageTransitionsTheme(
        //  builders: {
        //   TargetPlatform.android: GoTransitions.fadeUpwards,
        //  TargetPlatform.iOS: GoTransitions.cupertino,
        // TargetPlatform.macOS: GoTransitions.cupertino,
        //},
        // ),
        pageBuilder: GoTransitions.slide.toTop.withFade.build(
          builder: (context, state) => AddressScreen(),
        ),
      ),
    ],
    initialLocation: AppRoutes.splashscreen,
  );
}
