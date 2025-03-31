
import 'package:ecommerce/features/auth/data/models/profileModel.dart';

class UserState {}

final class UserInitial extends UserState {}

final class LoginLoading extends UserState {}

final class LoginSuccess extends UserState {}

final class LoginFailure extends UserState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

final class UploadProfilePic extends UserState {}
final class UploadProfilePicFailure extends UserState {}

final class SignupLoading extends UserState {}

final class SignupSuccess extends UserState {
  final String message;

  SignupSuccess({required this.message});
}

final class SignupFailure extends UserState {
  final String errMessage;

  SignupFailure({required this.errMessage});
}

final class GetProfileLoading extends UserState {}
final class GetProfileSuccess extends UserState {
  final ProfileModel model;

  GetProfileSuccess({required this.model});
}
final class GetProfileFailure extends UserState {
  final String errMessage;

  GetProfileFailure({required this.errMessage});
}