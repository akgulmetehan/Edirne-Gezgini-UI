import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_status.dart';
import 'package:edirne_gezgini_ui/model/dto/visitation_dto.dart';

import '../../model/enum/base_place_category.dart';

class VisitationsState {
  final VisitationsStatus visitationsStatus;
  final Map<BasePlaceCategory, List<VisitationDto>?> visitationList;

  VisitationsState({
    this.visitationsStatus = const InitialVisitationStatus(),
    this.visitationList = const {}
  });

  VisitationsState copyWith({
    VisitationsStatus? visitationsStatus,
    Map<BasePlaceCategory, List<VisitationDto>?>? visitationList
  }) {
    return VisitationsState(
        visitationsStatus: visitationsStatus ?? this.visitationsStatus,
        visitationList: visitationList ?? this.visitationList);
  }
}
