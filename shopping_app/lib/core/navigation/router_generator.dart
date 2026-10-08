import 'package:go_router/go_router.dart';
import 'package:shopping/core/navigation/app_routes.dart';
import 'package:shopping/features/auth/login.dart';

class RouterGenerator {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) => Login(),
      ),
    ],
    initialLocation: AppRoutes.login,
  );
}
