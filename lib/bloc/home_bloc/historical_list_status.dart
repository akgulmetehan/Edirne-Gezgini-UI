abstract class HistoricalListStatus{
  const HistoricalListStatus();
}

class InitialHistoricalListStatus extends HistoricalListStatus {
  const InitialHistoricalListStatus();
}

class GetHistoricalListPending extends HistoricalListStatus {}

class GetHistoricalListSuccess extends HistoricalListStatus {}

class GetHistoricalListFailed extends HistoricalListStatus {
  final String message;
  final Object? exception;

  GetHistoricalListFailed({required this.message, this.exception});
}