import 'package:dio/dio.dart';
import 'package:sample/core/network/api_clients.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClients {
  late Dio dio;

  DioClients() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiClients.baseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          String? token = sharedPreferences.getString('token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401) {
            // Handle 401 errors (e.g., session expiration)
          }
          return handler.next(error);
        },
      ),
    );
  }

  Dio getDio() => dio;
}
