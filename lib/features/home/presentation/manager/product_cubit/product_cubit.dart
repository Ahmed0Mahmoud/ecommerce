import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/network/api_consumer.dart';
import 'package:ecommerce/core/network/end_points.dart';
import 'package:ecommerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_states.dart';



class ProductCubit extends Cubit<ProductStates> {
  final ApiConsumer api;
  ProductCubit(this.api) : super(ProductInitial());

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







// Future getCatProducts({required int catId}) async {
  //   try {
  //     emit(ProductsLoading());
  //
  //     final response = await api.get(
  //       ApiEndpoints.getCategoryProductsEndPoint(),
  //       queryParameters: {
  //         "categoryId" : catId,
  //         "offset" : 0,
  //         "limit" : 10,
  //       }
  //     );
  //
  //     // Ensure response.data exists and is a List
  //     if (response.data is List) {
  //       final List<ProductModel> models = (response.data as List)
  //           .map((item) => ProductModel.fromJson(item))
  //           .toList();
  //
  //       emit(ProductsSuccess(models: models));
  //     } else {
  //       emit(ProductsFailure(errMessage: "Invalid response format"));
  //     }
  //   } on ServerException catch (e) {
  //     emit(ProductsFailure(errMessage: e.errModel.errMessage));
  //   } catch (e) {
  //     emit(ProductsFailure(errMessage: "An unexpected error occurred"));
  //   }
  // }

}
