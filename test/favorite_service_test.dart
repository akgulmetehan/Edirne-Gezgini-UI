import 'package:edirne_gezgini_ui/model/dto/create_favorite_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/repository/favorite_repository.dart';
import 'package:edirne_gezgini_ui/service/favorite_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final favoriteRepository = FavoriteRepository();
  final favoriteService = FavoriteService(favoriteRepository: favoriteRepository);
  const String userId = "6db0c8a2-bb39-4328-be10-6e6fe823ad34";
  const favoritePlaceId = "e0bcd362-be4a-4868-8e91-439e2ceee97f";
  const favoriteId = "bf1ced01-b892-49c3-956d-7cbdad69f75b";
  
  final createFavoriteDto = CreateFavoriteDto(
      favoritePlaceId: favoritePlaceId,
      userId: userId,
      category: BasePlaceCategory.place);
  
  group("favorite service test", () {
    test("createFavorite endpoint", () async {
      final response = await favoriteService.createFavorite(createFavoriteDto);

      expect(response.message == "success", true);
    });

    test("getFavorite endpoint", () async {
      final response = await favoriteService.getFavorite(favoriteId);

      expect(response.message == "success", true);
      expect(response.result != null, true);
    });

    test("getAll endpoint", () async {
      final response = await favoriteService.getAll();

      expect(response.message == "success", true);
      expect(response.result?.isNotEmpty, true);
    });

    test("deleteFavorite endpoint", () async {
      final response = await favoriteService.deleteFavorite(favoriteId);

      expect(response.message == "success", true);
    });
  });
}