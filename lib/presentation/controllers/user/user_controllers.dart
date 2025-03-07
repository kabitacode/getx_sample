import 'package:get/get.dart';
import 'package:sample/domain/entities/user/user.dart';
import 'package:sample/domain/usecases/user/user_use_case.dart';

class UserControllers extends GetxController{
  final UserUseCase userUseCase;

  UserControllers(this.userUseCase);

  var users = <User>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    isLoading(true);
    try {
      users.value = await userUseCase();
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}