abstract class RegisterEvent{}

class RegisterNameChanged extends RegisterEvent{
  String name;
  RegisterNameChanged({required this.name});
}

class RegisterLastNameChanged extends RegisterEvent{
  String lastName;
  RegisterLastNameChanged({required this.lastName});
}

class RegisterEmailChanged extends RegisterEvent{
  String email;
  RegisterEmailChanged({required this.email});
}

class RegisterPasswordChanged extends RegisterEvent{
  String password;
  RegisterPasswordChanged({required this.password});
}

class RegisterSubmitted extends RegisterEvent{}