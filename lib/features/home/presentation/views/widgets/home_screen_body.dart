import 'package:ecommerce/core/network/api_consumer.dart';
import 'package:ecommerce/core/utils/service_locator.dart';
import 'package:ecommerce/features/home/presentation/manager/home_cubit.dart';
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
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<ApiConsumer>())..getCategories(),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
