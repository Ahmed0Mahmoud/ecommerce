import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/network/api_consumer.dart';
import 'package:ecommerce/core/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/categories_model/categories_model.dart';
import 'category_states.dart';



class CategoryCubit extends Cubit<CategoryStates> {
  final ApiConsumer api;



  CategoryCubit(this.api) : super(CategoryInitial());

  int curIndex= 1 ;

   getCurrecntIndex({required int index}){
    curIndex = index+1;
  }



  Future<void> getCategories() async {
    try {
      emit(CategoriesLoading());
      final response = await api.get(ApiEndpoints.getCategoriesEndPoint);

      if (response is List) {
        final List<CategoriesModel> models = response
            .map((item) => CategoriesModel.fromJson(item))
            .toList(); // Corrected syntax

        emit(CategoriesSuccess(models: models));
      } else {
        emit(CategoriesFailure(errMessage: "Invalid response format"));
      }
    } on ServerException catch (e) {
      emit(CategoriesFailure(errMessage: e.errModel.errMessage));
    }
  }
}
