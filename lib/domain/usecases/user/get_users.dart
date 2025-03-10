import 'package:sample/domain/entities/user/user.dart';
import 'package:sample/domain/repositories/user/user_repositories.dart';

class GetUsers {
  final UserRepositories repositories;

  GetUsers(this.repositories);

  Future<List<User>> call() async {
    return await repositories.getUsers();
  }
}