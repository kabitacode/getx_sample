import 'package:get/get.dart';
import 'package:sample/domain/entities/user/user.dart';
import 'package:sample/domain/usecases/user/get_users.dart';

class UserControllers extends GetxController{
  final GetUsers getUsers;

  UserControllers(this.getUsers);

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
      users.value = await getUsers();
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}