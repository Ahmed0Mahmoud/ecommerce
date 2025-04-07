
import 'package:ecommerce/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_states.dart';



class CategoryCubit extends Cubit<CategoryStates> {
  final HomeRepo repo;



  CategoryCubit(this.repo) : super(CategoryInitial());

  int curIndex= 1 ;

   getCurrentIndex({required int index}){
    curIndex = index+1;
  }



  getCategories() async {
    emit(CategoriesLoading());
    final result = await repo.getCategories();
    result.fold((failure){
      emit(CategoriesFailure(errMessage: failure));
    }, (model){
      emit(CategoriesSuccess(models: model));
    });
  }
}
