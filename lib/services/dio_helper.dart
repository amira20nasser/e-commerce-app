import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio = Dio();

  Future<List> getProducts({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.get(path, queryParameters: queryParameters);
    return response.data["products"];
  }
}
