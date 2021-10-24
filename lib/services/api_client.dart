import 'package:dio/dio.dart';

class ApiClient {
  static const String _baseUrl =
      'https://private-fd718-testdev7.apiary-mock.com/api';
  Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
    ),
  );

  Future<Response> signIn(String email, String password) async {
    final Map<String, dynamic> data = {'email': email, 'password': password};
    final Response response = await _dio.post('/test', data: data);
    return response;
  }
}
