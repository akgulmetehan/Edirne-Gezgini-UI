abstract class CurrentUserStatus {
  const CurrentUserStatus();
}

class InitialCurrentUserStatus extends CurrentUserStatus{
  const InitialCurrentUserStatus();
}

class GetCurrentUserPending extends CurrentUserStatus{}

class GetCurrentUserSuccess extends CurrentUserStatus{}

class GetCurrentUserFailed extends CurrentUserStatus{
  final String message;
  final Object? exception;

  GetCurrentUserFailed({required this.message, this.exception});
}