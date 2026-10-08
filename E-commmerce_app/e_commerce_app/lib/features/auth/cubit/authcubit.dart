import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/secure_storage.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/auth/cubit/authstates.dart';
import 'package:e_commerce_app/features/auth/models/login_token.dart';
import 'package:e_commerce_app/features/auth/repo/auth_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<Authstates> {
  AuthCubit(this.authApi) : super(InitialState());

  final AuthApi authApi;

  Future<void> login(String username, String password) async {
    emit(Loadingstate()); // Better than InitialState when logging in

    final Either<String, LoginToken> res = await authApi.login(
      username: username,
      password: password,
    );
    res.fold(
      (left) {
        emit(Errorstate(left));
      },
      (right) {
        emit(Successstate("Login successfully"));
      },
    );
  }

  void logout() {
    sl<SecureStorage>().removeToken();
  }
}
