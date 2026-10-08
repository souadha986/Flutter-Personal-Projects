import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/cart/cart_repo/cart_repo.dart';
import 'package:e_commerce_app/features/cart/cubit/cubit_states.dart';
import 'package:e_commerce_app/features/cart/models/cart_model.dart';
import 'package:e_commerce_app/features/homescreen/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CubitStates> {
  CartCubit(this.cartrepo) : super((Cartintialestate()));
  final CartRepo cartrepo;
  Future<void> fetchcarts() async {
    emit(Cartloadingstate());

    final Either<String, CartModel> res = await cartrepo.getcart();
    res.fold(
      (left) {
        emit(Carterrorstate(left));
      },
      (right) {
        emit(Cartsuccessstate(right));
      },
    );
  }

  Future<void> addtocart({
    required Products product,
    required int quantity,
  }) async {
    emit(Cartloadingstate());
    final date = DateTime.now().toIso8601String().split('T').first;

    final Either<String, CartModel> res = await cartrepo.addCart(
      date: date,
      product: product,
      quantity: quantity,
    );
    res.fold(
      (left) {
        emit(Cartaddingerrorstate(left));
      },
      (right) {
        emit(Cartaddingsuccessstate(right));
      },
    );
  }
}
