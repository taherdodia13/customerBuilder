import 'package:cutomer_builder/models/create_customer_model.dart';
import 'package:cutomer_builder/utils/app_data.dart';
import 'package:cutomer_builder/utils/exports.dart';

class CreateCustomerController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController desc = TextEditingController();
  DataList? customer;
  bool isUpdating = false;

  @override
  void onInit() {
    customer = Get.arguments;

    if (customer != null) {
      name.text = customer?.name ?? '';
      email.text = customer?.email ?? '';
      phone.text = (customer?.phone ?? '').toString();
      desc.text = customer?.desc ?? '';
      isUpdating = true;
    }
    super.onInit();
  }

  @override
  void dispose() {
    name.text = '';
    email.text = '';
    phone.text = '';
    desc.text = '';
    isUpdating = false;
    super.dispose();
  }

  @override
  void onClose() {
    name.text = '';
    email.text = '';
    phone.text = '';
    desc.text = '';
    super.onClose();
  }

  void createCustomer() async {
    try {
      if (await checkConnection()) {
        loadingDialog();
        var result = await Get.find<RestService>().createCustomer(
          CreateCustomerInputModel(
            email: email.text,
            desc: desc.text,
            phone: int.tryParse(phone.text) ?? 0,
            name: name.text,
            userId: AppData.userId,
          ),
        );
        if ((result.email?.isNotEmpty ?? false)) {
          Get.find<HomeController>().getData();
          Get.back();
          update();
          getDisplayAlert('Success', 'Customer created successfully');
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

  void updateCustomer(int id) async {
    try {
      if (await checkConnection()) {
        loadingDialog();
        var result = await Get.find<RestService>().updateCustomer(
            CreateCustomerInputModel(
              email: email.text,
              desc: desc.text,
              phone: int.tryParse(phone.text) ?? 0,
              name: name.text,
              userId: AppData.userId,
            ),
            id);
        if ((result.email?.isNotEmpty ?? false)) {
          Get.find<HomeController>().getData();
          Get.back();
          update();
          getDisplayAlert('Success', 'Customer updated successfully');
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
