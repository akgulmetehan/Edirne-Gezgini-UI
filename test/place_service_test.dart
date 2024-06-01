import 'package:edirne_gezgini_ui/model/dto/create_place_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_place_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/place_category.dart';
import 'package:edirne_gezgini_ui/repository/place_repository.dart';
import 'package:edirne_gezgini_ui/service/place_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final placeRepository = PlaceRepository();
  final placeService = PlaceService(placeRepository: placeRepository);
  String placeId = "";

  final createPlaceDto = CreatePlaceDto(
      title: "test321",
      info: "test456",
      location: "test654",
      image: "",
      category: PlaceCategory.historical);

  final updatePlaceDto = UpdatePlaceDto(
      id: placeId,
      title: createPlaceDto.title,
      info: "test changed",
      location: createPlaceDto.location,
      image: createPlaceDto.image,
      category: createPlaceDto.category);

  group("place service test", () {
    test("createPlace endpoint", () async {
      final response = await placeService.createPlace(createPlaceDto);

      expect(response.message == "success", true);
    });

    test("getPlace endpoint", () async {
      final response = await placeService.getPlace(placeId);

      expect(response.message == "success", true);
      expect(response.result != null, true);
    });

    test("getAll endpoint", () async {
      final response = await placeService.getAll();

      expect(response.message == "success", true);
      expect(response.result?.isNotEmpty, true);
    });

    test("updatePlace endpoint", () async {
      final response = await placeService.updatePlace(updatePlaceDto);

      expect(response.message == "success", true);
    });

    test("deletePlace endpoint", () async {
      final response = await placeService.deletePlace(placeId);

      expect(response.message == "success", true);
    });
  });
}
