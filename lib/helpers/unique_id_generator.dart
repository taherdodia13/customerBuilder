import 'dart:math';

import '../utils/exports.dart';

// Function to generate a unique ID under 100,000
int generateUniqueId() {
  Random random = Random();
  int uniqueId = random.nextInt(100000);
  return uniqueId;
}

// Function to check if the generated ID exists in the user data
Future<bool> checkIfIdExists(int userId) async {
  try {
    var result = await Get.find<RestService>().userList();
    if (result.data.isNotEmpty) {
      return result.data.any((element) => element.userId == userId);
    }
    return false;
  } catch (e) {
    return false;
  }
}

void register() async {
  try {
    if (await checkConnection()) {
      loadingDialog();

      int uniqueId = generateUniqueId();
      bool idExists = await checkIfIdExists(uniqueId);

      while (idExists) {
        uniqueId = generateUniqueId();
        idExists = await checkIfIdExists(uniqueId);
      }

        SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('userUniqueId', uniqueId); // Store the unique ID


      Get.back();
    } else {
      getDisplayAlert('Error', 'Please check your internet connection');
    }
  } catch (e) {
    Get.back();
    getDisplayAlert('Error', 'An error occurred');
  }
}
