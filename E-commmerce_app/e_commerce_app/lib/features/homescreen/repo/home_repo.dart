import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/core/networking/endpoints.dart';
import 'package:e_commerce_app/features/homescreen/models/categories.dart';
import 'package:e_commerce_app/features/homescreen/models/product.dart';

class HomeRepo {
  final DioHelper dio;
  HomeRepo(this.dio);
  Future<Either<String, List<Products>>> getProducts() async {
    try {
      final response = await dio.getrequest(endpoints: EndPoints.allproduct);

      if (response.statusCode == 200) {
        final List<Products> products = productsFromJson(response.data);
        return Right(products);
      } else {
        return Left("something went wrong");
      }
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, List<Products>>> getProductscategories({
    required String category,
  }) async {
    try {
      final response = await dio.getrequest(
        endpoints: "${EndPoints.categoryproduct}/$category",
      );

      if (response.statusCode == 200) {
        final List<Products> products = productsFromJson(response.data);
        return Right(products);
      } else {
        return Left("something went wrong");
      }
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, List<String>>> getCategories() async {
    try {
      final response = await dio.getrequest(endpoints: EndPoints.allcategories);

      if (response.statusCode == 200) {
        final List<String> categories = categoriessFromJson(response.data);
        return Right(categories);
      } else {
        return Left("something went wrong");
      }
    } catch (error) {
      return Left(error.toString());
    }
  }
}
