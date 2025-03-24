import 'package:ecommerce/features/home/presentation/views/widgets/account_screen_body.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: AccountScreenBody()));
  }
}
