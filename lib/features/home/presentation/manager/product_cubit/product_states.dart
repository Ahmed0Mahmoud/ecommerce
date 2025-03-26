import 'package:ecommerce/features/home/data/models/product_model/product_model.dart';


class ProductStates {}

final class ProductInitial extends ProductStates {}

final class ProductsLoading extends ProductStates {}

final class ProductsSuccess extends ProductStates {
  final List<ProductModel> models;

  ProductsSuccess({required this.models});
}

final class ProductsFailure extends ProductStates {
  final String errMessage;

  ProductsFailure({required this.errMessage});
}
