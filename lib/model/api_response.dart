import 'dart:io';

class APIResponse{
  Object? result;

  String message;

  HttpStatus httpStatus;

  APIResponse({required this.result, required this.message, required this.httpStatus});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      result: json['result'],
      message: json['message'],
      httpStatus: json['status'],
    );
  }
}