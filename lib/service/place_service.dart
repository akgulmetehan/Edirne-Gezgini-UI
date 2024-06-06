 import 'dart:io';

import 'package:edirne_gezgini_ui/model/dto/create_place_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/place_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_place_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/place_category.dart';

import '../model/response.dart';
import '../repository/place_repository.dart';

class PlaceService {
  final PlaceRepository placeRepository;

  PlaceService({required this.placeRepository});

  Future<Response> getPlace(String id) async {
    final response = await placeRepository.getPlace(id);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    PlaceDto placeDto =
        PlaceDto.fromMap(response.result as Map<String, dynamic>);

    return Response<PlaceDto>("success", result: placeDto);
  }

  Future<Response<List<PlaceDto>>> getAll() async {
    final response = await placeRepository.getAll();

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    List<PlaceDto> placeDtoList = (response.result as List<dynamic>)
        .map((item) => PlaceDto.fromMap(item as Map<String, dynamic>))
        .toList();

    return Response<List<PlaceDto>>("success", result: placeDtoList);
  }

  Future<Response<List<PlaceDto>>> getAllByCategory(PlaceCategory category) async {
    final response = await placeRepository.getAllByCategory(category);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    List<PlaceDto> placeDtoList = (response.result as List<dynamic>)
        .map((item) => PlaceDto.fromMap(item as Map<String, dynamic>))
        .toList();

    return Response<List<PlaceDto>>("success", result: placeDtoList);
  }

  Future<Response> createPlace(CreatePlaceDto dto) async {
    final response = await placeRepository.createPlace(dto);

    return Response(response.message);
  }

  Future<Response> updatePlace(UpdatePlaceDto dto) async {
    final response = await placeRepository.updatePlace(dto);

    return Response(response.message);
  }

  Future<Response> deletePlace(String id) async {
    final response = await placeRepository.deletePlace(id);

    return Response(response.message);
  }
}
