class AuthenticationRequestDto {
  final String email;

  final String password;

  AuthenticationRequestDto({required this.email, required this.password});

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map  = <String, dynamic>{};
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}