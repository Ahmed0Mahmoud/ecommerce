
import 'package:ecommerce/features/auth/presentation/manager/user_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/account_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  void initState() {
    context.read<UserCubit>().getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: ()async {
           await context.read<UserCubit>().getProfile();
        },
        child: Scaffold(
          body: AccountScreenBody(),
        ),
      ),
    );
  }
}
