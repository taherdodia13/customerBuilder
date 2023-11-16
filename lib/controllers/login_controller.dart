import 'package:cutomer_builder/utils/exports.dart';
import 'package:flutter/services.dart';

import '../utils/app_data.dart';

class LoginController extends GetxController {
  Rx<bool> isObscure = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GetDataResponseModel getData = GetDataResponseModel(currentPage: 1);

  Future<void> login() async {
    try {
      if (await checkConnection()) {
        loadingDialog();

        var result = await Get.find<RestService>().login();
        if (result.data.isNotEmpty) {
          Get.back();

          if (result.data.any((element) =>
              (element.email == emailController.text.trim() &&
                  element.password == passwordController.text.trim()))) {
            AppData.userId = result.data
                .where((element) => (element.email == emailController.text.trim() &&
                    element.password == passwordController.text.trim()))
                .first
                .id;
            AppData.email = result.data
                .where((element) => (element.email == emailController.text.trim() &&
                    element.password == passwordController.text.trim()))
                .first
                .email
                .toString();
            AppData.isUserLoggedIn = true;
            Get.offAllNamed(AppPages.home);
            HapticFeedback.lightImpact();
          } else {
            getDisplayAlert('Alert', 'Please enter correct password and email');
          }
        } else {
          Get.back();
          getDisplayAlert('Error', ServiceConfiguration.commonErrorMessage);
        }
      } else {
        getDisplayAlert('Error', 'Please Check your internet connection');
      }
    } catch (e) {
      e.toString();
      Get.back();
      getDisplayAlert(
        "Error",
        ServiceConfiguration.commonErrorMessage,
      );
    }
  }
}
