import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:ecommerce/core/utils/appRouter.dart';
import 'package:ecommerce/features/auth/presentation/manager/user_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/user_state.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/page_heading.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../sign_up_screen.dart';
import 'custom_form_button.dart';
import 'custom_input_field.dart';
import 'forget_password_button.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ShowAnimatedSnackbar(
            message: 'success',
            type: AnimatedSnackBarType.success,
          ).show(context);
          GoRouter.of(context).pushReplacement(Approuter.mainViewRoute);
        } else if (state is LoginFailure) {
          ShowAnimatedSnackbar(
            message: state.errMessage,
            type: AnimatedSnackBarType.error,
          ).show(context);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/shopping.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    //key: ,
                    child: Column(
                      children: [
                        PageHeading(title: 'Sign-in'),
                        CustomInputField(
                          labelText: 'Email',
                          hintText: 'Your Email',
                          obscureText: false,
                          suffixIcon: false,
                          controller: context.read<UserCubit>().signInEmail,
                        ),
                        SizedBox(height: 16),
                        CustomInputField(
                          labelText: 'Password',
                          hintText: 'Your Password',
                          obscureText: true,
                          suffixIcon: true,
                          controller: context.read<UserCubit>().signInPassword,
                        ),
                        SizedBox(height: 16),
                        ForgetPasswordButton(),
                        SizedBox(height: 16),
                        state is LoginLoading
                            ? Center(child: CircularProgressIndicator())
                            : CustomFormButton(
                              innerText: 'Sign In',
                              onPressed: () {
                                context.read<UserCubit>().login();
                              },
                            ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account ? ',
                                style: TextStyle(
                                  color: Color(0xff939393),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign-up',
                                  style: TextStyle(
                                    color: Color(0xff748288),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
