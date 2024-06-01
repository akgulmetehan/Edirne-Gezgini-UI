import 'dart:io';

import '../model/dto/create_restaurant_dto.dart';
import '../model/dto/restaurant_dto.dart';
import '../model/dto/update_restaurant_dto.dart';
import '../model/response.dart';
import '../repository/restaurant_repository.dart';

class RestaurantService {
  final RestaurantRepository restaurantRepository;

  RestaurantService({required this.restaurantRepository});

  Future<Response<RestaurantDto>> getRestaurant(String id) async {
    final response = await restaurantRepository.getRestaurant(id);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    final RestaurantDto restaurantDto =
        RestaurantDto.fromMap(response.result as Map<String, dynamic>);
    return Response("success", result: restaurantDto);
  }

  Future<Response<List<RestaurantDto>>> getAll() async {
    final response = await restaurantRepository.getAll();

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    final List<RestaurantDto> restaurantDtoList =
        (response.result as List<dynamic>)
            .map((item) => RestaurantDto.fromMap(item as Map<String, dynamic>))
            .toList();
    return Response("success", result: restaurantDtoList);
  }

  Future<Response<RestaurantDto>> getRestaurantByTitle(String title) async {
    final response = await restaurantRepository.getRestaurantByTitle(title);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    final RestaurantDto restaurantDto =
        RestaurantDto.fromMap(response.result as Map<String, dynamic>);
    return Response("success", result: restaurantDto);
  }

  Future<Response<String>> createRestaurant(
      CreateRestaurantDto createRestaurantDto) async {
    final response =
        await restaurantRepository.createRestaurant(createRestaurantDto);
    return Response(response.message);
  }

  Future<Response<String>> updateRestaurant(
      UpdateRestaurantDto updateRestaurantDto) async {
    final response =
        await restaurantRepository.updateRestaurant(updateRestaurantDto);
    return Response(response.message);
  }

  Future<Response<String>> deleteRestaurant(String id) async {
    final response = await restaurantRepository.deleteRestaurant(id);
    return Response(response.message);
  }
}
