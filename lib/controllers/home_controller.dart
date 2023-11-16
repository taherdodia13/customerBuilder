import 'package:cutomer_builder/utils/app_data.dart';
import 'package:cutomer_builder/utils/exports.dart';

class HomeController extends GetxController {
  RxList<DataList> dataList = <DataList>[].obs;
  final RxList<DataList> filteredDataList = <DataList>[].obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void filterData(String query) {
    if (query.isEmpty) {
      filteredDataList.assignAll(dataList);
    } else {
      filteredDataList.assignAll(dataList.where((data) {
        return (data.name ?? '').toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }

  void deleteCustomer(int id) async {
    try {
      if (await checkConnection()) {
        loadingDialog();
        await Get.find<RestService>().deleteCustomer(id);
        getData();
        Get.back();
        update();
        getDisplayAlert('Success', 'Customer deleted successfully');
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

  void getData() async {
    try {
      if (await checkConnection()) {
        loadingDialog();
        dataList.clear();
        filteredDataList.clear();
        var result = await Get.find<RestService>().getData();

        if (result.data.isNotEmpty) {
          dataList.assignAll(
            result.data
                .where((element) => element.userId == AppData.userId)
                .toList(),
          );
          filteredDataList.assignAll(dataList);
          Get.back();
          update();
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
