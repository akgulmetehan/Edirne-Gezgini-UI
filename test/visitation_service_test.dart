import 'package:edirne_gezgini_ui/model/dto/create_visitation_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/repository/visitation_repository.dart';
import 'package:edirne_gezgini_ui/service/visitation_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final visitationRepository = VisitationRepository();
  final visitationService =
      VisitationService(visitationRepository: visitationRepository);
  const visitationId = "0ffea5c3-ee24-453b-be53-dd9be693e3e7";

  final createVisitationDto = CreateVisitationDto(
      visitedPlaceId: "048452eb-2d6f-4abf-add1-2a81bc396d51",
      userId: "6db0c8a2-bb39-4328-be10-6e6fe823ad34",
      category: BasePlaceCategory.restaurant);

  group("visitation service test", () {
    test("createVisitation endpoint", () async {
      final response =
          await visitationService.createVisitation(createVisitationDto);

      expect(response.message == "success", true);
    });

    test("getVisitation endpoint", () async {
      final response = await visitationService.getVisitation(visitationId);

      expect(response.message == "success", true);
    });

    test("getAll endpoint", () async {
      final response = await visitationService.getAll();
      final result = response.result;

      expect(response.message == "success", true);
      expect(result?.isNotEmpty, true);
    });

    test("getAllByCategory endpoint", () async {
      const category = BasePlaceCategory.restaurant;
      final response = await visitationService.getAllByCategory(category);
      final result = response.result;

      expect(response.message == "success", true);
      expect(result?.isNotEmpty, true);
    });

    test("deleteVisitation endpoint", () async {
      final response = await visitationService.deleteVisitation(visitationId);

      expect(response.message == "success", true);
    });
  });
}
