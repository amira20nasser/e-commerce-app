import 'package:dio/dio.dart';
import 'package:ecommerce/providers/user_data.dart';
import 'package:flutter/rendering.dart';

class CustomApiService {
  static const baseUrl =
      'https://64f3185eedfa0459f6c64a42.mockapi.io/api/v1/users';

  final Dio _dio = Dio();

  Future<void> addUser(String name, String id, String email) async {
    try {
      final response = await _dio.post(
        baseUrl,
        data: {'name': name, 'favourites': [], 'email': email, 'UserId': id},
      );

      if (response.statusCode == 201) {
        debugPrint('User added successfully');
      } else {
        debugPrint('Failed to add user. Error: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Failed to add user. Error: $error');
    }
  }

  Future<Map<String, dynamic>> fetchDataByName(String email) async {
    debugPrint("fetchDataByName $email");
    final response = await _dio
        .get('https://64f3185eedfa0459f6c64a42.mockapi.io/api/v1/users/');
    List data = List<Map<String, dynamic>>.from(response.data);
    debugPrint("fetchDataByName $data");
    if (response.statusCode == 200) {
      final Map<String, dynamic>? item = data.firstWhere(
        (item) => item['email'] == email,
      );
      debugPrint("fetchDataByName $item");
      if (item != null) {
        return item;
      } else {
        throw Exception('Item not found');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List> getUserFavorites() async {
    debugPrint("in getUserFavorites:${UserData().email}");
    Map<String, dynamic> user = await fetchDataByName(UserData().email);
    List favUser = user['favourites'];
    debugPrint("in getUserFavorites:$favUser");

    return favUser;
  }

  Future<void> addUserFavorite(String email, String favoriteId) async {
    Map<String, dynamic> user = await fetchDataByName(email);
    debugPrint("addUserFavorite $user");
    final url = '$baseUrl/${user["UserId"]}';
    debugPrint(url);

    user['favourites'].add(favoriteId);

    final updateResponse = await _dio.put(
      url,
      data: user,
    );

    if (updateResponse.statusCode == 200) {
      debugPrint('User favorite added successfully');
    } else {
      debugPrint(
          'Failed to add user favorite. Error: ${updateResponse.statusCode}');
    }
  }

  Future<void> removeUserFavorite(String email, String favoriteId) async {
    Map<String, dynamic> user = await fetchDataByName(email);
    debugPrint("removeUserFavorite: $user");
    final url = '$baseUrl/${user["UserId"]}';
    debugPrint(url);

    user['favourites'].remove(favoriteId);

    final updateResponse = await _dio.put(
      url,
      data: user,
    );

    if (updateResponse.statusCode == 200) {
      debugPrint('User favorite added successfully');
    } else {
      debugPrint(
          'Failed to add user favorite. Error: ${updateResponse.statusCode}');
    }
  }
}
