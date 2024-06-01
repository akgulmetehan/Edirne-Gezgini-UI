import 'dart:io';

import 'package:edirne_gezgini_ui/model/api_response.dart';
import 'package:edirne_gezgini_ui/model/dto/accommodation_dto.dart';
import 'package:edirne_gezgini_ui/repository/accommodation_repository.dart';

import '../model/dto/create_accommodation_dto.dart';
import '../model/dto/update_accommodation_dto.dart';
import '../model/enum/accommodation_category.dart';
import '../model/response.dart';

class AccommodationService {
  final AccommodationRepository accommodationRepository;

  AccommodationService({required this.accommodationRepository});

  Future<Response<AccommodationDto>> getAccommodation(String id) async {
    final response = await accommodationRepository.getAccommodation(id);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    AccommodationDto accommodationDto =
        AccommodationDto.fromMap(response.result as Map<String, dynamic>);
    return Response<AccommodationDto>("success", result: accommodationDto);
  }

  Future<Response<List<AccommodationDto>>> getAllAccommodations() async {
    final response = await accommodationRepository.getAll();

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    List<AccommodationDto> accommodationList = (response.result
            as List<dynamic>)
        .map((item) => AccommodationDto.fromMap(item as Map<String, dynamic>))
        .toList();
    return Response<List<AccommodationDto>>("success",
        result: accommodationList);
  }

  Future<Response<List<AccommodationDto>>> getAllAccommodationsByCategory(
      AccommodationCategory category) async {
    final response = await accommodationRepository.getAllByCategory(category);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    List<AccommodationDto> accommodationList = (response.result
            as List<dynamic>)
        .map((item) => AccommodationDto.fromMap(item as Map<String, dynamic>))
        .toList();
    return Response<List<AccommodationDto>>("success",
        result: accommodationList);
  }

  Future<Response<String>> createAccommodation(
      CreateAccommodationDto createAccommodationDto) async {
    final APIResponse response = await accommodationRepository
        .createAccommodation(createAccommodationDto);
    return Response(response.message);
  }

  Future<Response<String>> updateAccommodation(
      UpdateAccommodationDto updateAccommodationDto) async {
    final response = await accommodationRepository
        .updateAccommodation(updateAccommodationDto);
    return Response(response.message);
  }

  Future<Response<String>> deleteAccommodation(String id) async {
    final response = await accommodationRepository.deleteAccommodation(id);
    return Response(response.message);
  }
}
