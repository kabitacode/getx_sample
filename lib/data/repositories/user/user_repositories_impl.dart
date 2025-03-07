import 'package:sample/data/datasources/user/user_remote_data_source.dart';
import 'package:sample/domain/entities/user/user.dart';
import 'package:sample/domain/repositories/user/user_repositories.dart';

class UserRepositoriesImpl implements UserRepositories{
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoriesImpl(this.userRemoteDataSource);

  @override
  Future<List<User>> getUsers() async{
    return await userRemoteDataSource.fetchUsers();
  }
}