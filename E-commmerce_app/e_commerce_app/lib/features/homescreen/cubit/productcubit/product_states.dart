import 'package:e_commerce_app/features/homescreen/models/product.dart';

abstract class ProductStates {}

class InitialState extends ProductStates {}

class LoadingState extends ProductStates {}

class LoadedState extends ProductStates {
  final List<Products> products;
  LoadedState(this.products);
}

class ErrorState extends ProductStates {
  final String error;
  ErrorState(this.error);
}
