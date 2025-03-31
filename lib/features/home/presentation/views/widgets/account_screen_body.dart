import 'package:ecommerce/features/auth/presentation/manager/user_cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetProfileSuccess) {
          return ListView(
            children: [
              const SizedBox(height: 16),

              //! Profile Picture
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  scale: 5,
              state.model.profilePic.isNotEmpty
              ? state.model.profilePic
                  : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHEB-FmVpoxcfMWFBHLpHd7FjhRBXJ6aaLjw&s",
              ),
              ),
               const SizedBox(height: 16),

              //! Edit Profile Button
              MaterialButton(
                onPressed: () {
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(
                  // builder: (context) => EditProfileScreen(user: state.user),
                  // ),
                  // );
                },
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 17),
                ),
              ),

              //! Name
              ListTile(
                title: Text(state.model.name),
                leading: const Icon(Icons.person),
              ),
              const SizedBox(height: 16),

              //! Email
              ListTile(
                title: Text(state.model.email),
                leading: const Icon(Icons.email),
              ),
              const SizedBox(height: 16),
            ],
          );
        } else if (state is GetProfileFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Failed to load profile',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => context.read<UserCubit>().getProfile(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
