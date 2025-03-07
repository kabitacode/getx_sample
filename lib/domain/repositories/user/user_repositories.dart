import 'package:sample/domain/entities/user/user.dart';

abstract class UserRepositories {
  Future<List<User>> getUsers();
}