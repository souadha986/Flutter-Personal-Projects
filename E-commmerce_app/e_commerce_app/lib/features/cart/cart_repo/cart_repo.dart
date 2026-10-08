import 'dart:developer' show log;

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/core/networking/endpoints.dart';
import 'package:e_commerce_app/features/cart/models/cart_model.dart';
import 'package:e_commerce_app/features/homescreen/models/product.dart';

class CartRepo {
  final DioHelper dioHelper;
  const CartRepo(this.dioHelper);
  Future<Either<String, CartModel>> getcart() async {
    try {
      final response = await dioHelper.getrequest(
        endpoints: "${EndPoints.getcart}2",
      );
      if (response.statusCode == 200) {
        final cart = CartModel.fromJson(response.data[0]);
        return Right(cart);
      } else {
        return Left("something went wrong");
      }
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, CartModel>> addCart({
    required date,
    required Products product,
    required int quantity,
  }) async {
    try {
      final response = await dioHelper.putrequest(
        endpoints: "${EndPoints.updatecart}2",

        data: {
          "userId": 2,
          "date": date,
          "products": [
            {"productId": product.id, "quantity": quantity},
          ],
        },
      );

      if (response.statusCode == 200) {
        final cart = CartModel.fromJson(response.data);
        return Right(cart);
      } else {
        return Left("something went wrong");
      }
    } catch (error) {
      log("here2");
      return Left(error.toString());
    }
  }
}
