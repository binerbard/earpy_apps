import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:earpy_app/configs/color.dart';

class Alert {
  static void success({String status = "Success", required String message}) {
    Get.snackbar(status, message,
        backgroundColor: ColorInitial.success,
        colorText: ColorInitial.light,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  }

  static void error({String status = "Error", required String message}) {
    Get.snackbar(status, message,
        backgroundColor: ColorInitial.danger,
        colorText: ColorInitial.light,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  }

  static void notification(
      {String status = "Notification", required String message}) {
    Get.snackbar(status, message,
        backgroundColor: ColorInitial.light,
        colorText: ColorInitial.dark,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  }

  static void alerts({String status = "Alert", required String message}) {
    Get.snackbar(status, message,
        backgroundColor: ColorInitial.warning,
        colorText: ColorInitial.dark,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  }

  static void loadingProcess() {
    Get.dialog(SizedBox(
      width: Get.width * 2,
      height: Get.height * 0.6,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }

  static void endProcess() {
    Get.back();
  }
}
