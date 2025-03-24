import 'package:ecommerce/features/home/presentation/manager/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 22),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CategoryCard(catModel: state.models[index]),
                );
              },
              itemCount: 7,
            ),
          );
        } else if (state is CategoriesFailure) {
          return SizedBox(height: 60, child: Text(state.errMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
