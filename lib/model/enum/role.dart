enum Role {
  user,
  admin,
}

extension RoleExtension on Role {
  static Role fromString(String roleString) {
    switch(roleString) {
      case "ADMIN":
        return Role.admin;

      default:
        return Role.user;
    }
  }

  static String roleToJson(Role role) {
    return role.toString().toUpperCase().split('.').last;
  }
}