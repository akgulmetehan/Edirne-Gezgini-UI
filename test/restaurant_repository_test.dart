import 'package:edirne_gezgini_ui/model/dto/create_restaurant_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_restaurant_dto.dart';
import 'package:edirne_gezgini_ui/repository/restaurant_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final restaurantRepository = RestaurantRepository();

  final createRestaurantDto = CreateRestaurantDto(
      title: "test123",
      image: "",
      info: "test456",
      location: "test654");

  const restaurantId = "29a94eca-8d85-4c72-a7dd-1e298030bc4f";

  final updateRestaurantDto = UpdateRestaurantDto(
      id: restaurantId,
      title: "test changed",
      image: "",
      info: createRestaurantDto.info,
      location: createRestaurantDto.info);

  group("restaurant repository test", () {
    test("createRestaurant endpoint", () async {
      final response = await restaurantRepository.createRestaurant(createRestaurantDto);

      expect(response.httpStatus, 201);
    });

    test("getRestaurant endpoint", () async {
      final response = await restaurantRepository.getRestaurant(restaurantId);

      expect(response.httpStatus, 200);
    });

    test("getAll endpoint", () async {
      final response = await restaurantRepository.getAll();
      final result = response.result as List<dynamic>;

      expect(response.httpStatus, 200);
      expect(result.isNotEmpty, true);
    });

    test("getRestaurantByTitle endpoint", () async {
      final response = await restaurantRepository.getRestaurantByTitle(createRestaurantDto.title);

      expect(response.httpStatus, 200);
    });

    test("updateRestaurant endpoint", () async {
      final response = await restaurantRepository.updateRestaurant(updateRestaurantDto);

      expect(response.httpStatus, 200);
    });

    test("deleteRestaurant endpoint", () async {
      final response = await restaurantRepository.deleteRestaurant(restaurantId);

      expect(response.httpStatus, 204);
    });
  });
}