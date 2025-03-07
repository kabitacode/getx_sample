import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/data/datasources/user/user_remote_data_source.dart';
import 'package:sample/data/repositories/user/user_repositories_impl.dart';
import 'package:sample/domain/repositories/user/user_repositories.dart';
import 'package:sample/domain/usecases/user/user_use_case.dart';
import 'package:sample/presentation/controllers/user/user_controllers.dart';

class UserPage extends StatelessWidget {

  UserPage({super.key});

  final Dio dio = Dio();
  late final UserControllers userControllers;

  @override
  Widget build(BuildContext context) {
    final UserRepositories = UserRepositoriesImpl(UserRemoteDataSourceImpl(dio));
    final getUsers = UserUseCase(UserRepositories);
    userControllers = Get.put(UserControllers(getUsers));

    return Scaffold(
      appBar: AppBar(title: const Text("User")),
      body: Obx((){
        if (userControllers.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userControllers.errorMessage.isNotEmpty) {
          return Center(child: Text(userControllers.errorMessage.value));
        }

        return ListView.builder(itemCount: userControllers.users.length, itemBuilder: (context, index) {
          final user = userControllers.users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        });
      }),
    );
  }
}