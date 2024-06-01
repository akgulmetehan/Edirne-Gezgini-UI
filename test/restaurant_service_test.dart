import 'package:edirne_gezgini_ui/model/dto/create_restaurant_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_restaurant_dto.dart';
import 'package:edirne_gezgini_ui/repository/restaurant_repository.dart';
import 'package:edirne_gezgini_ui/service/restaurant_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final restaurantRepository = RestaurantRepository();
  final restaurantService =
      RestaurantService(restaurantRepository: restaurantRepository);
  const restaurantId = "93859a8f-1028-49b3-a9d8-fd45fe485cee";

  final createRestaurantDto = CreateRestaurantDto(
      title: "test123", image: "", info: "test456", location: "test654");

  final updateRestaurantDto = UpdateRestaurantDto(
      id: restaurantId,
      title: "test changed",
      image: createRestaurantDto.image,
      info: createRestaurantDto.info,
      location: createRestaurantDto.location);

  group("restaurant service test", () {
    test("createRestaurant endpoint", () async {
      final response =
          await restaurantService.createRestaurant(createRestaurantDto);

      expect(response.message == "success", true);
    });

    test("getRestaurant endpoint", () async {
      final response = await restaurantService.getRestaurant(restaurantId);

      expect(response.message == "success", true);
    });

    test("getAll endpoint", () async {
      final response = await restaurantService.getAll();

      expect(response.message == "success", true);
      expect(response.result?.isNotEmpty, true);
    });

    test("getRestaurantByTitle endpoint", () async {
      final response = await restaurantService
          .getRestaurantByTitle(createRestaurantDto.title);

      expect(response.message == "success", true);
    });

    test("updateRestaurant endpoint", () async {
      final response =
          await restaurantService.updateRestaurant(updateRestaurantDto);

      expect(response.message == "success", true);
    });

    test("deleteRestaurant endpoint", () async {
      final response = await restaurantService.deleteRestaurant(restaurantId);

      expect(response.message == "success", true);
    });
  });
}
