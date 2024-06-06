abstract class LoginStatus{
  const LoginStatus();
}

class InitialLoginStatus extends LoginStatus {
  const InitialLoginStatus();
}

class LoginPending extends LoginStatus {
  LoginPending();
}

class LoginSuccess extends LoginStatus {}

class LoginFailed extends LoginStatus {
  final String message;
  final Object? exception;

  LoginFailed({required this.message, this.exception});
}

