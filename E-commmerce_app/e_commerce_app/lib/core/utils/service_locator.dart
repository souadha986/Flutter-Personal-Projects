import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/core/utils/secure_storage.dart';
import 'package:e_commerce_app/features/auth/cubit/authcubit.dart';
import 'package:e_commerce_app/features/auth/repo/auth_api.dart';
import 'package:e_commerce_app/features/cart/cart_repo/cart_repo.dart';
import 'package:e_commerce_app/features/homescreen/repo/home_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioHelper>(DioHelper());
  sl.registerSingleton<SecureStorage>(SecureStorage());
  sl.registerLazySingleton<AuthApi>(() => AuthApi(sl<DioHelper>()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepo(sl<DioHelper>()));
  sl.registerLazySingleton<CartRepo>(() => CartRepo(sl<DioHelper>()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
}
