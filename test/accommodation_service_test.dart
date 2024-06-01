import 'package:edirne_gezgini_ui/model/dto/create_accommodation_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_accommodation_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/accommodation_category.dart';
import 'package:edirne_gezgini_ui/model/response.dart';
import 'package:edirne_gezgini_ui/repository/accommodation_repository.dart';
import 'package:edirne_gezgini_ui/service/accommodation_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final accommodationRepository = AccommodationRepository();
  final accommodationService =
      AccommodationService(accommodationRepository: accommodationRepository);
  const String accommodationId = "269d3e03-4c8c-415e-861d-de1dff7a6c41";

  final createAccommodationDto = CreateAccommodationDto(
      title: "test",
      image: "",
      info: "test123",
      location: "test456",
      category: AccommodationCategory.hotel);

  group("accommodation service test", () {
    test("createAccommodation endpoint", () async {
      final Response<String> response = await accommodationService
          .createAccommodation(createAccommodationDto);

      expect(response.message == "success", true);
    });

    test("getAccommodation endpoint", () async {
      final response =
          await accommodationService.getAccommodation(accommodationId);

      expect(response.message == "success", true);
      expect(response.result != null, true);
    });

    test("getAllAccommodations endpoint", () async {
      final response = await accommodationService.getAllAccommodations();

      expect(response.message, "success");
      expect(response.result?.isNotEmpty, true);
    });

    test("getAllAccommodationsByCategory endpoint", () async {
      const category = AccommodationCategory.hotel;
      final response =
          await accommodationService.getAllAccommodationsByCategory(category);

      expect(response.message, "success");
      expect(response.result?.isNotEmpty, true);
    });

    test("updateAccommodation endpoint", () async {
      final updateAccommodationDto = UpdateAccommodationDto(
          id: accommodationId,
          title: createAccommodationDto.title,
          image: createAccommodationDto.image,
          info: "test changed",
          location: "test changed",
          category: createAccommodationDto.category);

      final response = await accommodationService
          .updateAccommodation(updateAccommodationDto);

      expect(response.message == "success", true);
    });

    test("deleteAccommodation endpoint", () async {
      final response =
          await accommodationService.deleteAccommodation(accommodationId);

      expect(response.message == "success", true);
    });
  });
}
