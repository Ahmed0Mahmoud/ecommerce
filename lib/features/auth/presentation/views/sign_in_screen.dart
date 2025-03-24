import 'package:ecommerce/features/auth/presentation/views/widgets/signIn_screen_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SignInScreenBody()));
  }
}
