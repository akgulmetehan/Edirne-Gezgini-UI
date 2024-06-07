import 'package:edirne_gezgini_ui/model/dto/create_visitation_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';

abstract class VisitationsEvent{}

class GetVisitationList extends VisitationsEvent{}

class DeleteVisitation extends VisitationsEvent{
  final String visitationId;
  final BasePlaceCategory category;

  DeleteVisitation({required this.visitationId, required this.category});
}

class CreateVisitation extends VisitationsEvent {
  final CreateVisitationDto createVisitationDto;

  CreateVisitation({required this.createVisitationDto});
}

