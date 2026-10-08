import 'package:e_commerce_app/features/cart/models/cart_model.dart';

abstract class CubitStates {}

class Cartintialestate extends CubitStates {}

class Cartloadingstate extends CubitStates {}

class Cartsuccessstate extends CubitStates {
  final CartModel cart;
  Cartsuccessstate(this.cart);
}

class Cartaddingsuccessstate extends CubitStates {
  final CartModel cart;
  Cartaddingsuccessstate(this.cart);
}

class Cartaddingerrorstate extends CubitStates {
  final String error;
  Cartaddingerrorstate(this.error);
}

class Carterrorstate extends CubitStates {
  final String error;
  Carterrorstate(this.error);
}
