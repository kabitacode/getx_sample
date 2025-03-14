import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClients {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get users => '$baseUrl/users';
  static String get login => '$baseUrl/login';
}