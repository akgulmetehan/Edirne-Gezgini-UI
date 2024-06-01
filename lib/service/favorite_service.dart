import 'dart:io';

import '../model/dto/create_favorite_dto.dart';
import '../model/dto/favorite_dto.dart';
import '../model/response.dart';
import '../repository/favorite_repository.dart';

class FavoriteService {
  final FavoriteRepository favoriteRepository;

  FavoriteService({required this.favoriteRepository});

  Future<Response<FavoriteDto>> getFavorite(String id) async {
    final response = await favoriteRepository.getFavorite(id);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    FavoriteDto favoriteDto =
        FavoriteDto.fromMap(response.result as Map<String, dynamic>);

    return Response("success", result: favoriteDto);
  }

  Future<Response<List<FavoriteDto>>> getAll() async {
    final response = await favoriteRepository.getAll();

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    List<FavoriteDto> favoriteList = (response.result as List<dynamic>)
        .map((item) => FavoriteDto.fromMap(item as Map<String, dynamic>))
        .toList();

    return Response("success", result: favoriteList);
  }

  Future<Response<String>> createFavorite(
      CreateFavoriteDto createFavoriteDto) async {
    final response = await favoriteRepository.createFavorite(createFavoriteDto);
    return Response(response.message);
  }

  Future<Response<String>> deleteFavorite(String id) async {
    final response = await favoriteRepository.deleteFavorite(id);
    return Response(response.message);
  }
}
