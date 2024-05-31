import 'package:edirne_gezgini_ui/model/dto/create_favorite_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/repository/favorite_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final favoriteRepository = FavoriteRepository();
  const String userId = "6db0c8a2-bb39-4328-be10-6e6fe823ad34";
  const favoritePlaceId = "5b315401-b1f3-4b08-9fb9-b19673c9a13a";
  String favoriteId = "f0e70d24-4e2d-45f8-91c7-15cfd2bad680";

  final createFavoriteDto = CreateFavoriteDto(
      favoritePlaceId: favoritePlaceId,
      userId: userId,
      category: BasePlaceCategory.accommodation);

  group("favorite repository test", () {
    test("getFavorite endpoint", () async {
      final response = await favoriteRepository.getFavorite(favoriteId);

      expect(response.httpStatus, 200);
    });
    
    test("getAll endpoint", () async {
      final response = await favoriteRepository.getAll();
      
      expect(response.httpStatus, 200);
    });

    test("createFavorite endpoint ", () async {

      final response = await favoriteRepository.createFavorite(createFavoriteDto);

      expect(response.httpStatus, 201);

    });

    test("deleteFavorite endpoint", () async {
      final response = await favoriteRepository.deleteFavorite(favoriteId);

      expect(response.httpStatus, 204);
    });

  });
}