
import 'package:ecommerce/features/home/data/models/product_model/product_model.dart';
import 'package:ecommerce/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_states.dart';



class ProductCubit extends Cubit<ProductStates> {
  final HomeRepo repo;
  ProductCubit(this.repo) : super(ProductInitial());


  List<ProductModel> cartOrders = [];
  void addToCart(ProductModel model) {
    cartOrders.add(model);
    emit(ProductUpdatedState()); // Emit a state to update UI
  }

  Future getProducts(int id) async {
    emit(ProductsLoading());
    final result = await repo.getProducts(id);
    result.fold((failure){
      emit(ProductsFailure(errMessage: failure));
    }, (model){
      emit(ProductsSuccess(models: model));
    });
  }





}
