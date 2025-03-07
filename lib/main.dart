import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sample/presentation/pages/user/user_page.dart';

void main() async{
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserPage(),
      );
  }
}