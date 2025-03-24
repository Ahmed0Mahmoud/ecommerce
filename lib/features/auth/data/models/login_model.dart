import 'package:ecommerce/core/network/end_points.dart';

class LoginModel {
  final String token;
  final String refreshToken;

  LoginModel({required this.token, required this.refreshToken});

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      token: jsonData[ApiKeys.token],
      refreshToken: jsonData[ApiKeys.refreshToken],
    );
  }
}
