import 'package:cutomer_builder/utils/exports.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
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
                    color: AppColor.userDesc,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: AppColor.userDesc,
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  obscureText: true,
                  controller: controller.passwordController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your password',
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
              ),
              30.heightBox,
              MaterialButton(
                onPressed: () {
                  debugPrint('Sign Up pressed');
                },
                color: AppColor.blueColor,
                minWidth: 120,
                height: 40,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: AppColor.blueColor),
                ),
                child: const Text(
                  'Create',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ).onTap(() async {
                  if (controller.emailController.text.trim().isEmpty) {
                    getDisplayAlert('Alert', 'Enter a valid email');
                  } else if (controller.passwordController.text
                      .trim()
                      .isEmpty) {
                    getDisplayAlert('Alert', 'Enter a valid password');
                  } else {
                    await controller.register();
                  }
                }),
              ),
              20.heightBox,
              Row(
                children: [
                  const Text(
                    "Already have an account?    ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColor.userDesc,
                    ),
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ).onTap(() {
                    Get.offAllNamed(AppPages.loginPage);
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
