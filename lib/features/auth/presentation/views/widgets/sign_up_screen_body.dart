import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:ecommerce/core/utils/appRouter.dart';
import 'package:ecommerce/features/auth/presentation/manager/user_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/user_state.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/page_heading.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/pick_image_widget.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_form_button.dart';
import 'custom_input_field.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ShowAnimatedSnackbar(
            message: 'success',
            type: AnimatedSnackBarType.success,
          ).show(context);
        } else if (state is SignupFailure) {
          ShowAnimatedSnackbar(
            message: state.errMessage,
            type: AnimatedSnackBarType.error,
          ).show(context);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            //key: ,
            child: Column(
              children: [
                PageHeading(title: 'Sign-up'),
                PickImageWidget(),
                SizedBox(height: 10),
                CustomInputField(
                  labelText: 'Name',
                  hintText: 'Your name',
                  controller: context.read<UserCubit>().signUpName,
                ),
                SizedBox(height: 16),
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'Your email',
                  controller: context.read<UserCubit>().signUpEmail,
                ),
                SizedBox(height: 16),
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'Your password',
                  suffixIcon: true,
                  obscureText: true,
                  controller: context.read<UserCubit>().signUpPassword,
                ),

                SizedBox(height: 26),
                state is SignupLoading
                    ? Center(child: CircularProgressIndicator())
                    : CustomFormButton(
                      innerText: 'Signup',
                      onPressed: () {
                        context.read<UserCubit>().signup();
                      },
                    ),
                SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: TextStyle(
                          color: Color(0xff939393),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                         GoRouter.of(context).push(Approuter.signInViewRoute);
                        },
                        child: Text(
                          'Sign-in',
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
                SizedBox(height: 26),
              ],
            ),
          ),
        );
      },
    );
  }
}
