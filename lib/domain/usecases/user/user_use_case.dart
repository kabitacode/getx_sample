import 'package:sample/domain/entities/user/user.dart';
import 'package:sample/domain/repositories/user/user_repositories.dart';

class UserUseCase {
  final UserRepositories repositories;

  UserUseCase(this.repositories);

  Future<List<User>> call() async {
    return await repositories.getUsers();
  }
}