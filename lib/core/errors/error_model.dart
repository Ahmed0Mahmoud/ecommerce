import '../network/end_points.dart';

class ErrorModel {
  final int status;
  final String errMessage;

  ErrorModel({required this.status, required this.errMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKeys.status] ?? 0,
      errMessage:
          jsonData[ApiKeys.errMessage] ?? "email or password is incorrect",
    );
  }
}
