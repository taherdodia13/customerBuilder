import 'package:cutomer_builder/utils/exports.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, \nWelcome Back',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              40.heightBox,
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor.userDesc,
                ),
              ),
              10.heightBox,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email',
                  ),
                ),
              ),
              30.heightBox,
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor.userDesc,
                ),
              ),
              10.heightBox,
              Obx(() {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: TextField(
                    obscureText: controller.isObscure.value,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.isObscure.value =
                              !controller.isObscure.value;
                          controller.isObscure.refresh();
                        },
                      ),
                    ),
                  ),
                );
              }),
              40.heightBox,
              MaterialButton(
                onPressed: () {
                  if (controller.emailController.text.isEmpty) {
                    getDisplayAlert('Alert', 'Please enter a valid email');
                  } else if (controller.passwordController.text.isEmpty) {
                    getDisplayAlert('Alert', 'Please enter a valid password');
                  } else {
                    controller.login();
                  }
                },
                color: AppColor.blueColor,
                minWidth: 120.w,
                height: 40.h,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: AppColor.blueColor),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, // Change text color as needed
                    fontSize: 18.0,
                  ),
                ),
              ),
              20.heightBox,
              Row(
                children: [
                  const Text(
                    "Don't have account ?    ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColor.userDesc,
                    ),
                  ),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: AppColor.blackColor,
                    ),
                  ).onTap(() {
                    Get.offAllNamed(AppPages.signupPage);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
