import 'package:ecommerce/features/auth/data/models/signUp_model.dart';

class UserState {}

final class UserInitial extends UserState {}

final class LoginLoading extends UserState {}

final class LoginSuccess extends UserState {}

final class LoginFailure extends UserState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

final class UploadProfilePic extends UserState {}

final class SignupLoading extends UserState {}

final class SignupSuccess extends UserState {
  final String message;

  SignupSuccess({required this.message});
}

final class SignupFailure extends UserState {
  final String errMessage;

  SignupFailure({required this.errMessage});
}
