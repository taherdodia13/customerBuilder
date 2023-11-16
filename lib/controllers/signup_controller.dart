import 'package:cutomer_builder/utils/app_data.dart';
import 'package:cutomer_builder/utils/exports.dart';
import 'package:flutter/services.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    try {
      if (await checkConnection()) {
        loadingDialog();

        var result = await Get.find<RestService>().signup(SignUpInputModel(
          email: emailController.text,
          password: passwordController.text,
        ));
        if (result.id != 0) {
          Get.back();
          AppData.isUserLoggedIn = true;
          AppData.email = result.email ?? "";
          AppData.userId = result.id;
          HapticFeedback.lightImpact();
          Get.offNamedUntil(
            '/home',
            ModalRoute.withName('/'),
          );
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
