import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/core/networking/endpoints.dart';
import 'package:e_commerce_app/core/utils/secure_storage.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/auth/models/login_token.dart';

//so to resume everything in dio methodes post,or get we throw te errors to the function that use it and after that we handle dio exeption the error, coming from servers ....
//we do this when we have either and we want to show  the errors
class AuthApi {
  final DioHelper dioHelper;
  AuthApi(this.dioHelper);
  Future<Either<String, LoginToken>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dioHelper.postrequest(
        endpoints: EndPoints.login,
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final loginToken = LoginToken.fromJson(response.data);

        if (loginToken.token == null) {
          return Left("Server did not return a valid token");
        }
        await sl<SecureStorage>().setToken(loginToken.token!);
        return Right(loginToken);
      } else {
        return Left("Login failed ,please try again");
      }
    } catch (error) {
      if (error is DioException) {
        if (error.type == DioExceptionType.badResponse) {
          return Left(error.response!.data.toString());
        } else if (error.error != null && error.error is SocketException) {
          return Left("No internet connection. Please check your network.");
        } else if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          return Left("Connection timed out. Please try again.");
        } else {
          return Left("Something went wrong. Please try again.");
        }
      }
      return Left("Something went wrong. Please try again.");
    }
  }
}
