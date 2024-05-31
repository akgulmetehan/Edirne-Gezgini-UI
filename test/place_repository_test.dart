import 'package:edirne_gezgini_ui/model/dto/create_place_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_place_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/place_category.dart';
import 'package:edirne_gezgini_ui/repository/place_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final placeRepository = PlaceRepository();

  final createPlaceDto = CreatePlaceDto(
      title: "test123",
      info: "test456",
      location: "test654",
      image: "",
      category: PlaceCategory.historical);

  const placeId = "e0bcd362-be4a-4868-8e91-439e2ceee97f";

  final updatePlaceDto = UpdatePlaceDto(
      id: placeId,
      title: createPlaceDto.title,
      info: "test changed",
      location: createPlaceDto.location,
      image: "",
      category: createPlaceDto.category);

  group("place repository test", () {

    test("createPlace endpoint", () async {
      final response = await placeRepository.createPlace(createPlaceDto);

      expect(response.httpStatus, 201);
    });

    test("getPlace endpoint", () async {
      final response = await placeRepository.getPlace(placeId);

      expect(response.httpStatus, 200);
    });

    test("getAll endpoint", () async {
      final response = await placeRepository.getAll();

      expect(response.httpStatus, 200);
    });

    test("updatePlace endpoint", () async {
      final response = await placeRepository.updatePlace(updatePlaceDto);

      expect(response.httpStatus, 200);
    });

    test("deletePlace endpoint", () async{
      final response = await placeRepository.deletePlace(placeId);

      expect(response.httpStatus, 200);
    });
  });
}