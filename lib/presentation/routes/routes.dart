import 'package:get/get.dart';
import 'package:sample/presentation/bindings/user/user_binding.dart';
import 'package:sample/presentation/pages/splash/splash_page.dart';
import 'package:sample/presentation/pages/user/user_page.dart';

class Routes {
  static Future<String> get initialRoute async {
    return USER;
  }

  // static const ROOT = '/';
  static const USER = '/user';
}

class Navigation {
  static List<GetPage> routes = [
    // GetPage(name: Routes.ROOT, page: () => SplashPage()),
    GetPage(name: Routes.USER, page: () => UserPage(), binding: UserBinding()),
  ];
}
