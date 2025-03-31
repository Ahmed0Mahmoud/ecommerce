
import '../../../data/models/categories_model/categories_model.dart';

sealed class CategoryStates {}

final class CategoryInitial extends CategoryStates {}

final class CategoriesLoading extends CategoryStates {}

final class CategoriesSuccess extends CategoryStates {
  final List<CategoriesModel> models;

  CategoriesSuccess({required this.models});
}

final class CategoriesFailure extends CategoryStates {
  final String errMessage;

  CategoriesFailure({required this.errMessage});
}

final class CategoryIndexChanged extends CategoryStates {}
