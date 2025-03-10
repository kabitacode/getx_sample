import 'package:sample/core/network/api_clients.dart';
import 'package:sample/data/models/user/user_model.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> fetchUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl(this.dio);

  @override
  Future<List<UserModel>> fetchUsers() async {
   final response = await dio.get(ApiClients.users);
   
   if (response.statusCode == 200) {
     return (response.data as List)
    .map((user) => UserModel.fromJson(user))
    .toList();
   } else {
    throw Exception('Failed to Load users');
   }
  }
}