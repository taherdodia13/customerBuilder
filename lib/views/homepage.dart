import 'package:cutomer_builder/utils/app_data.dart';

import '../utils/exports.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Customers'),
        actions: [
          Icon(
            Icons.logout,
            size: 20.sp,
            weight: 500,
            color: AppColor.whiteColor,
          ).onTap(() {
            AppData.isUserLoggedIn = false;
            AppData.userId = 0;
            AppData.email = '';
            Get.offAllNamed(AppPages.loginPage);
          }),
          20.widthBox,
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.searchController,
            decoration: InputDecoration(
              labelText: 'Search by Name',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (value) {
              controller.filterData(value);
            },
          ).p(10),
          Obx(() {
            if (controller.filteredDataList.isEmpty) {
              return Expanded(
                child: Center(
                  child: Text(
                    'Create your first customer',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: controller.filteredDataList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.listTileColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          title: Text(
                            controller.filteredDataList[index].name?.trim() ?? '',
                            style: TextStyle(
                                color: AppColor.userDesc,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(
                            'Description:  ${controller.filteredDataList[index].desc?.trim()}',
                            style: TextStyle(
                                color: AppColor.userDesc,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 20.sp,
                              color: AppColor.deleteButtonColor,
                            ),
                            onPressed: () {
                              showDeleteConfirmation(
                                  controller.filteredDataList[index].id,
                                  context);
                            },
                          ),
                        ),
                      ).onTap(() {
                        Get.to(() => CustomerDetails(
                            customer: controller.filteredDataList[index]));
                      });
                    }),
              );
            }
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CreateCustomerController>().name.text = '';
          Get.find<CreateCustomerController>().email.text = '';
          Get.find<CreateCustomerController>().phone.text = '';
          Get.find<CreateCustomerController>().desc.text = '';
          Get.find<CreateCustomerController>().isUpdating = false;
          Get.toNamed(AppPages.createCustomer);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showDeleteConfirmation(int id, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this resume?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: AppColor.deleteButtonColor),
              ),
              onPressed: () {
                controller.deleteCustomer(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
