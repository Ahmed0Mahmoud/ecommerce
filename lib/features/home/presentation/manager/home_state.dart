
import '../../data/models/categories_model/categories_model.dart';

sealed class HomeStates {}

final class HomeInitial extends HomeStates {}

final class CategoriesLoading extends HomeStates {}

final class CategoriesSuccess extends HomeStates {
  final List<CategoriesModel> models;

  CategoriesSuccess({required this.models});
}

final class CategoriesFailure extends HomeStates {
  final String errMessage;

  CategoriesFailure({required this.errMessage});
}
