import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/network/api_consumer.dart';
import 'package:ecommerce/core/network/end_points.dart';
import 'package:ecommerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_states.dart';



class ProductCubit extends Cubit<ProductStates> {
  final ApiConsumer api;
  ProductCubit(this.api) : super(ProductInitial());


  List<ProductModel> cartOrders = [];
  void addToCart(ProductModel model) {
    cartOrders.add(model);
    emit(ProductUpdatedState()); // Emit a state to update UI
  }

  Future getProducts(int id) async {
    try {
      emit(ProductsLoading());

      int offset = 0;
      int limit = 4; // Adjust limit based on API documentation
      bool hasMoreData = true;
      List<ProductModel> allProducts = [];

      while (hasMoreData) {
        final response = await api.get(
          ApiEndpoints.getProductsEndPoint,
          queryParameters: {
            "categoryId": id,
            "offset": offset,
            "limit": limit,
          },
        );

        if (response is List) {
          final List<ProductModel> models =
          response.map((item) => ProductModel.fromJson(item)).toList();

          allProducts.addAll(models);

          if (models.length < limit) {
            hasMoreData = false; // No more data available
          } else {
            offset += limit; // Move to the next batch
          }
        } else {
          hasMoreData = false; // Stop fetching on invalid response
          emit(ProductsFailure(errMessage: "Invalid response format"));
          return;
        }
      }

      emit(ProductsSuccess(models: allProducts));

    } on ServerException catch (e) {
      emit(ProductsFailure(errMessage: e.errModel.errMessage));
    }
  }





}
