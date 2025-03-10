import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sample/core/network/api_clients.dart';
import 'package:sample/core/network/dio_clients.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginControllers extends GetxController {
  final Dio dio = DioClients().getDio();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final response = await dio.post(
        ApiClients.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        String token = response.data['token'];

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString('token', token);
      } else {
        errorMessage.value = 'Oops something went wrong!';
      }
    } catch (e) {
      errorMessage.value = 'Oops something went wrong!';
    } finally {
      isLoading(false);
    }
  }
}
