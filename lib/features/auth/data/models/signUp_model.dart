import 'package:ecommerce/core/network/end_points.dart';

class SignUpModel {
  final List<String>? message;
  final String? error;
  final int? statusCode;

  SignUpModel({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      message: json[ApiKeys.message][0],
      error: json['error'],
      statusCode: json[ApiKeys.status],
    );
  }
}
