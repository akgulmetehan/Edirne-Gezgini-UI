class APIResponse{
  int httpStatus;

  String message;

  Object? result;

  APIResponse({required this.httpStatus, required this.message, this.result});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      httpStatus: json['httpStatus'],
      message: json['message'],
      result: json['result'],
    );
  }
}