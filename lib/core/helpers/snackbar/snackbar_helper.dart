import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void showError(String message){
    Get.showSnackbar(
      GetSnackBar(
        title: "Error",
        message: message.isNotEmpty ? message : "Oops something went wrong!",
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 4),
        snackPosition: SnackPosition.TOP,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        margin: EdgeInsets.all(16),
      )
    );
  }

  static void showSuccess(String message){
    Get.showSnackbar(
      GetSnackBar(
        title: "Error",
        message: message.isNotEmpty ? message : "Successfully!",
        backgroundColor: Colors.lightGreen,
        duration: const Duration(seconds: 4),
        snackPosition: SnackPosition.TOP,
      )
    );
  }
}