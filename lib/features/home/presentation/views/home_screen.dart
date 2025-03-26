import 'package:ecommerce/features/home/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/dio_consumer.dart';
import '../../../../core/utils/service_locator.dart';
import '../manager/category_cubit/category_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CategoryCubit(getIt.get<DioConsumer>())..getCategories(),
            ),
            BlocProvider(
              create: (context) => ProductCubit(getIt.get<DioConsumer>())
                ..getProducts(context.read<CategoryCubit>().curIndex),
            ),
          ],
          child: HomeScreenBody(),
        )
      ),
    );
  }
}
