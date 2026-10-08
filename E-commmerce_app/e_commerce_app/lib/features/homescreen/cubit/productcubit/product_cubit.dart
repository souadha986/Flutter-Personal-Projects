import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/features/homescreen/cubit/productcubit/product_states.dart';
import 'package:e_commerce_app/features/homescreen/models/product.dart';

import 'package:e_commerce_app/features/homescreen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(this.homeRepo) : super((InitialState()));

  final HomeRepo homeRepo;

  Future<void> fetchproducts() async {
    emit(LoadingState());

    final Either<String, List<Products>> res = await homeRepo.getProducts();
    res.fold(
      (left) {
        emit(ErrorState(left));
      },
      (right) {
        emit(LoadedState(right));
      },
    );
  }

  Future<void> categoryProduct({required String category}) async {
    emit(LoadingState());

    final Either<String, List<Products>> res = await homeRepo
        .getProductscategories(category: category);
    res.fold(
      (left) {
        emit(ErrorState(left));
      },
      (right) {
        emit(LoadedState(right));
      },
    );
  }
}
