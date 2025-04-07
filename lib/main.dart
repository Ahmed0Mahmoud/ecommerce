import 'package:ecommerce/core/utils/app_router.dart';
import 'package:ecommerce/core/utils/service_locator.dart';
import 'package:ecommerce/features/auth/data/repos/auth_repo.dart';
import 'package:ecommerce/features/auth/presentation/manager/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home/presentation/manager/cart_cubit/cart_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>UserCubit(getIt.get<AuthRepo>())),
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
    return MaterialApp.router(
      routerConfig: Approuter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
