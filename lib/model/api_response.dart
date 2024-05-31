class APIResponse {
  int httpStatus;

  String message;

  Object? result;

  APIResponse({required this.httpStatus, required this.message, this.result});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      httpStatus: stringToHttpStatus(json['httpStatus']),
      message: json['message'],
      result: json['result'],
    );
  }

  static int stringToHttpStatus(String status) {
    int httpStatus;
    switch (status) {
      case "OK":
        httpStatus = 200;
        break;

      case "NOT_FOUND":
        httpStatus = 404;
        break;

      case "FORBIDDEN":
        httpStatus = 403;
        break;

      case "CREATED":
        httpStatus = 201;

      case "NO_CONTENT":
        httpStatus = 204;

      default:
        httpStatus = -1;
    }

    return httpStatus;
  }
}
