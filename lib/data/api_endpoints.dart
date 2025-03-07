import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static String users = '$baseUrl/users';
}