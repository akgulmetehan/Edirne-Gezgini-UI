abstract class VisitationsStatus{
  const VisitationsStatus();
}

class InitialVisitationStatus extends VisitationsStatus{
  const InitialVisitationStatus();
}

class GetVisitationListPending extends VisitationsStatus{}

class GetVisitationListSuccess extends VisitationsStatus{}

class GetVisitationListFailed extends VisitationsStatus{
  final String message;
  final Object? exception;
  GetVisitationListFailed({required this.message, this.exception});

}

class DeleteVisitationPending extends VisitationsStatus{}

class DeleteVisitationSuccess extends VisitationsStatus{}

class DeleteVisitationFailed extends VisitationsStatus{
  final String message;
  final Object? exception;
  DeleteVisitationFailed({required this.message, this.exception});
}