
import '../../data/models/product_model/product_model.dart';

class CartState {}

final class CartInitial extends CartState {}
final class CartAdded extends CartState {
  final List<ProductModel> cartItems;
  final int totalPrice;

  CartAdded({required this.cartItems, required this.totalPrice});

}
final class CartFailure extends CartState {
  final String erMessage;

  CartFailure({required this.erMessage});
}
