abstract class RegisterStatus{
  const RegisterStatus();
}

class InitialRegisterStatus extends RegisterStatus {
  const InitialRegisterStatus();
}

class RegisterPending extends RegisterStatus{}

class RegisterSuccess extends RegisterStatus{}

class RegisterFailed extends RegisterStatus  {
  final String message;
  final Object? exception;

  RegisterFailed({required this.message, this.exception});
}