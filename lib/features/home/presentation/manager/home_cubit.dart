import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/network/api_consumer.dart';
import 'package:ecommerce/core/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/categories_model/categories_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  final ApiConsumer api;
  HomeCubit(this.api) : super(HomeInitial());

  Future<void> getCategories() async {
    try {
      emit(CategoriesLoading());
      final response = await api.get(ApiEndpoints.getCategoriesEndPoint);

      // Ensure response is a List and parse it correctly
      final List<dynamic> responseData = response as List<dynamic>;
      final List<CategoriesModel> models = responseData
          .map((json) => CategoriesModel.fromJson(json))
          .toList();

      emit(CategoriesSuccess(models: models));
    } on ServerException catch (e) {
      emit(CategoriesFailure(errMessage: e.errModel.errMessage));
    }
  }

}
