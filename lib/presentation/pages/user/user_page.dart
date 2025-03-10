import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/core/helpers/snackbar/snackbar_helper.dart';
import 'package:sample/presentation/controllers/user/user_controllers.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  final Dio dio = Dio();
  final UserControllers userControllers = Get.find<UserControllers>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User")),
      body: Obx(() {
        if (userControllers.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userControllers.errorMessage.isNotEmpty) {
          Future.microtask(() => SnackbarHelper.showError(userControllers.errorMessage.value));
        }

        return ListView.builder(
          itemCount: userControllers.users.length,
          itemBuilder: (context, index) {
            final user = userControllers.users[index];
            return ListTile(title: Text(user.name), subtitle: Text(user.email));
          },
        );
      }),
    );
  }
}
