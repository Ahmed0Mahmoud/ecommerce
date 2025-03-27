
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/category_cubit/category_cubit.dart';
import '../../manager/category_cubit/category_states.dart';
import 'categories_shimmer_effect.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 75,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CategoryCard(
                    catModel: state.models[index],
                    index: index,
                  ),
                );
              },
              itemCount: state.models.length,
            ),
          );
        } else if (state is CategoriesFailure) {
          return SizedBox(height: 60, child: Text(state.errMessage));
        } else {
          return const CategoriesShimmerEffect(); // Show shimmer when loading
        }
      },
    );
  }
}

