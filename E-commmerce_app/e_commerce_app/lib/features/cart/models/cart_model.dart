class CartModel {
  final int id;
  final int userId;
  final DateTime date;
  final List<CartProduct> products;
  final int v; // __v from backend

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  /// fromJson factory
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"] as int,
      userId: json["userId"] as int,
      date: DateTime.parse(json["date"]),
      products: (json["products"] as List)
          .map((e) => CartProduct.fromJson(e))
          .toList(),
      v: json["__v"] ?? 0,
    );
  }

  /// toJson method
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "date": date.toIso8601String(),
      "products": products.map((e) => e.toJson()).toList(),
      "__v": v,
    };
  }
}

class CartProduct {
  final int productId;
  final int quantity;

  CartProduct({required this.productId, required this.quantity});

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      productId: json["productId"] as int,
      quantity: json["quantity"] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {"productId": productId, "quantity": quantity};
  }
}
