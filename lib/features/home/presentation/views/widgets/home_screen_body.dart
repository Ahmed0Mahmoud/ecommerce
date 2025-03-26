
import 'package:ecommerce/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/products_gridview.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/views/widgets/page_heading.dart';
import 'categories_listview.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.blueAccent,
      backgroundColor: Colors.white,
      onRefresh: ()async {
        context.read<ProductCubit>().getProducts(context.read<CategoryCubit>().curIndex);
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageHeading(title: 'Discover'),
            SearchWidget(),
            SizedBox(height: 16),
            CategoriesListView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(children: [ProductsGridView()]),
            ),
          ],
        ),
      ),
    );
  }
}
