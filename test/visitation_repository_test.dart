import 'package:edirne_gezgini_ui/model/dto/create_visitation_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/repository/visitation_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final visitationRepository = VisitationRepository();
  const visitationId = "d63b076d-045d-4cdc-a7fd-74923b4f3de4";

  final createVisitationDto = CreateVisitationDto(
      visitedPlaceId: "5b315401-b1f3-4b08-9fb9-b19673c9a13a",
      userId: "6db0c8a2-bb39-4328-be10-6e6fe823ad34",
      category: BasePlaceCategory.accommodation,
      note: "test123"
  );

  group("visitation repository test", () {
    test("getVisitation endpoint", () async {
      final response = await visitationRepository.getVisitation(visitationId);

      expect(response.httpStatus, 200);
    });

    test("getAll endpoint", () async {
      final response = await visitationRepository.getAll();
      final result = response.result as List<dynamic>;

      expect(response.httpStatus, 200);
      expect(result.isNotEmpty, true);
    });

    test("getAllByCategory endpoint", () async {
      const category = BasePlaceCategory.place;

      final response = await visitationRepository.getAllByCategory(category);
      final result = response.result as List<dynamic>;

      expect(response.httpStatus, 200);
      expect(result.isNotEmpty, true);
    });

    test("createVisitation endpoint", () async {
      final response = await visitationRepository.createVisitation(createVisitationDto);

      expect(response.httpStatus, 201);
    });
    
    test("deleteVisitation endpoint", () async {
      final response = await visitationRepository.deleteVisitation(visitationId);
      
      expect(response.httpStatus, 204);
    });
  });
}
