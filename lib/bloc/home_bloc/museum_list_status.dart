abstract class MuseumListStatus{
  const MuseumListStatus();
}

class InitialMuseumListStatus extends MuseumListStatus {
  const InitialMuseumListStatus();
}

class GetMuseumListPending extends MuseumListStatus {}

class GetMuseumListSuccess extends MuseumListStatus {}

class GetMuseumListFailed extends MuseumListStatus {
  final String message;
  final Object? exception;

  GetMuseumListFailed({required this.message, this.exception});
}