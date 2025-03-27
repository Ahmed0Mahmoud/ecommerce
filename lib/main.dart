
import 'package:ecommerce/core/network/dio_consumer.dart';
import 'package:ecommerce/core/utils/service_locator.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/views/sign_in_screen.dart';
import 'features/home/presentation/manager/cart_cubit.dart';
import 'features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'features/home/presentation/manager/product_cubit/product_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(getIt.get<DioConsumer>())),
        BlocProvider(create: (context) => CartCubit(),),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),

      home: SignInScreen(),
    );
  }
}
