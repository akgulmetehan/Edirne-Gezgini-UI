import 'package:edirne_gezgini_ui/model/dto/accommodation_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/create_accommodation_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_accommodation_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/accommodation_category.dart';
import 'package:edirne_gezgini_ui/repository/accommodation_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final accommodationRepository = AccommodationRepository();

  final mockAccommodation = AccommodationDto(
      id: "5b315401-b1f3-4b08-9fb9-b19673c9a13a",
      title: "Hilly Hotel",
      image: "",
      info: "Edirne bölgesinde, üst kalite, spa, restoran olan otel. Çok güzel!!",
      location: "Şükrü Paşa Mah. Kıyık Cad. No.: 254, Edirne,",
      category: AccommodationCategory.hotel
  );


  group("accommodationRepository test", () {
    test("getAccommodation endpoint", () async {
      final response = await accommodationRepository.getAccommodation(mockAccommodation.id);

      expect(response.httpStatus, 200);

      final accommodationDto = AccommodationDto.fromMap(response.result as Map<String,dynamic>);

      expect(accommodationDto.id, mockAccommodation.id);
      expect(accommodationDto.category, mockAccommodation.category);
    });

    test("getAll endpoint", () async {
      final response = await accommodationRepository.getAll();

      final List<dynamic> result = response.result as List<dynamic>;

      expect(result.isNotEmpty, true);
    });

    test("getAllByCategory endpoint", () async {
      AccommodationCategory category = AccommodationCategory.hotel;
      final response = await accommodationRepository.getAllByCategory(category);

      final List<dynamic> result = response.result as List<dynamic>;

      expect(result.isNotEmpty, true);
    });

    test("createAccommodation endpoint", () async {
      final createAccommodationDto = CreateAccommodationDto(
          title: "test",
          image: "",
          info: "test123",
          location: "test456",
          category: AccommodationCategory.hotel);
      
      final response = await accommodationRepository.createAccommodation(createAccommodationDto);
      
      expect(response.httpStatus, 201);
      
    });

    test("updateAccommodation endpoint", () async{
      final updateAccommodationDto = UpdateAccommodationDto(
          id: mockAccommodation.id,
          title: mockAccommodation.title,
          image: "",
          info: "Harika bir otel, başarılı!",
          location: mockAccommodation.location,
          category: mockAccommodation.category);

      final response = await accommodationRepository.updateAccommodation(updateAccommodationDto);

      expect(response.httpStatus, 200);
    });

    test("deleteAccommodation endpoint", () async {
      String id = "3e8a8903-2a7f-4f14-be6d-b98cbc64cced"; //created accommodationDto id on endpoint "createAccommodation"

      final response = await accommodationRepository.deleteAccommodation(id);

      expect(response.httpStatus, 204);
    });
  });
}