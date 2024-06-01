class Response<T> {
  T? result;

  String message;

  Response(this.message, {this.result});
}