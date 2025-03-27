
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_model/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<ProductModel> models = [];
  int TotalPrice(){
    int price = 0;
    for(var i in models){
      price+= i.price!;
    }
    return price;
  }

  void AddToCart(ProductModel model){
    models.add(model);
    emit(CartAdded(cartItems: List.from(models), totalPrice: TotalPrice()));
  }

  void RemoveFromCart(ProductModel product){
    models.remove(product);
    emit(CartAdded(cartItems: List.from(models), totalPrice: TotalPrice()));
  }




}
