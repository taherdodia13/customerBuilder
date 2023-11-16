import '../utils/exports.dart';


class BaseController extends GetxController {
  var service = Get.find<RestService>();
  var isBusy = false.obs;
}
