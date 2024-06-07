import 'dart:io';

import 'package:edirne_gezgini_ui/repository/visitation_repository.dart';

import '../model/api_response.dart';
import '../model/dto/create_visitation_dto.dart';
import '../model/dto/visitation_dto.dart';
import '../model/enum/base_place_category.dart';
import '../model/response.dart';

class VisitationService {
  final VisitationRepository visitationRepository;

  VisitationService({required this.visitationRepository});

  Future<Response<VisitationDto>> getVisitation(String id) async {
    final response = await visitationRepository.getVisitation(id);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    VisitationDto visitationDto =
        VisitationDto.fromMap(response.result as Map<String, dynamic>);
    return Response<VisitationDto>("success", result: visitationDto);
  }

  Future<Response<List<VisitationDto>>> getAllByCategory(
      BasePlaceCategory category) async {
    final response = await visitationRepository.getAllByCategory(category);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    List<VisitationDto> visitationDtoList = (response.result as List<dynamic>)
        .map((item) => VisitationDto.fromMap(item as Map<String, dynamic>))
        .toList();
    return Response<List<VisitationDto>>("success", result: visitationDtoList);
  }

  Future<Response<String>> createVisitation(
      CreateVisitationDto createVisitationDto) async {
    final response =
        await visitationRepository.createVisitation(createVisitationDto);
    return Response(response.message);
  }

  Future<Response<String>> deleteVisitation(String id) async {
    final APIResponse response =
        await visitationRepository.deleteVisitation(id);
    return Response(response.message);
  }

  Future<Response<List<VisitationDto>>> getAll() async {
    final response = await visitationRepository.getAll();

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    List<VisitationDto> visitationDtoList = (response.result as List<dynamic>)
        .map((item) => VisitationDto.fromMap(item as Map<String, dynamic>))
        .toList();
    return Response<List<VisitationDto>>("success", result: visitationDtoList);
  }

  Future<Response<List<VisitationDto>>> getAuthenticatedUserVisitations() async{
    final response = await visitationRepository.getAuthenticatedUserVisitations();

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    List<VisitationDto> visitationDtoList = (response.result as List<dynamic>)
        .map((item) => VisitationDto.fromMap(item as Map<String, dynamic>))
        .toList();
    return Response<List<VisitationDto>>("success", result: visitationDtoList);
  }
}
