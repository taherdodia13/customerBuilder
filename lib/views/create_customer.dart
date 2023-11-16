import 'package:cutomer_builder/utils/exports.dart';

class CreateCustomer extends GetView<CreateCustomerController> {
  const CreateCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create New Customer'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            controller.name.text = '';
            controller.email.text = '';
            controller.phone.text = '';
            controller.desc.text = '';
            Get.back();
          },
        ),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildRoundedTextField(
                      controller.name,
                      'Full Name (Two words, max 16 characters)',
                    ).p(10),
                    _buildRoundedTextField(
                      controller.email,
                      'Email (Valid email)',
                    ).p(10),
                    _buildRoundedTextField(
                      controller.phone,
                      'Phone (Numeric only)',
                    ).p(10),
                    _buildRoundedTextField(
                      controller.desc,
                      'Description',
                    ).p(10),
                  ],
                ),
              ),
            ),
            _buildRoundedButton('Save', () {
              String fullName = controller.name.text;
              String email = controller.email.text;
              String phone = controller.phone.text;
              String desc = controller.desc.text;

              RegExp nameRegex = RegExp(r'^[A-Za-z]{1,16}\s[A-Za-z]{1,16}$');
              RegExp emailRegex = RegExp(
                  r'^([a-zA-Z]([^~`?\/\\{\}\|\+=_\-*&\^$#!@<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\\"]+)*){6,30}|(\".+\"))@((([a-zA-Z0-9]+\.)+[a-zA-Z]{2,}))$');
              RegExp phoneRegex = RegExp(r'^[0-9]*$');

              if (nameRegex.hasMatch(fullName) &&
                  emailRegex.hasMatch(email) &&
                  phoneRegex.hasMatch(phone) &&
                  fullName.isNotEmpty &&
                  email.isNotEmpty &&
                  phone.isNotEmpty &&
                  desc.isNotEmpty) {
                if (controller.isUpdating) {
                  controller.updateCustomer(controller.customer?.id ?? 0);
                } else {
                  controller.createCustomer();
                }
                Get.toNamed(AppPages.home);
              } else {
                if (!nameRegex.hasMatch(fullName) || (fullName.isEmpty)) {
                  Get.snackbar('Error', 'Please enter full name');
                } else if ((!emailRegex.hasMatch(email)) || (email.isEmpty)) {
                  Get.snackbar('Error', 'Please enter correct email');
                } else if ((!phoneRegex.hasMatch(phone)) || phone.isEmpty) {
                  Get.snackbar('Error', 'Please enter correct phone number');
                } else if (desc.isEmpty) {
                  Get.snackbar('Error', 'Please enter description information');
                } else {
                  Get.snackbar('Error', 'Please enter valid information');
                }
              }
            }, context),
          ],
        ).p(16),
      ),
    );
  }

  Widget _buildRoundedTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: AppColor.blueColor,
            width: 2.0,
          ),
        ),
      ),
      maxLines: maxLines,
      validator: (value) {
        if (label.contains('Full Name')) {
          RegExp nameRegex = RegExp(r'^[A-Za-z]{1,16}\s[A-Za-z]{1,16}$');
          if (!nameRegex.hasMatch(value!)) {
            return 'Enter two words with a maximum of 16 characters each.';
          }
        } else if (label.contains('Email')) {
          RegExp emailRegex = RegExp(
              r'^([a-zA-Z0-9_\\-\\.+]+)@([a-zA-Z0-9_\\-\\.]+)\.([a-zA-Z]{2,5})$');
          if (!emailRegex.hasMatch(value!)) {
            return 'Enter a valid email address';
          }
        } else if (label.contains('Phone')) {
          RegExp phoneRegex = RegExp(r'^[0-9]*$');
          if (!phoneRegex.hasMatch(value!)) {
            return 'Enter a valid numeric phone number';
          }
        }
        return null;
      },
    );
  }

  Widget _buildRoundedButton(
      String text, VoidCallback onPressed, BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      minWidth: context.width,
      color: AppColor.blueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
