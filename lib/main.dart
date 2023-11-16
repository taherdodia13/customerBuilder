import 'package:cutomer_builder/utils/app_data.dart';

import 'utils/exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerControllers();
  await AppData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Customer Builder',
          initialRoute:
              AppData.isUserLoggedIn ? AppPages.home : AppPages.loginPage,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

void registerControllers() {
  Get.put(RestService(), permanent: true);
  Get.put(() => LoginController(), permanent: true);
  Get.lazyPut(() => CreateCustomerController(), fenix: true);
  Get.lazyPut(() => SignUpController(), fenix: true);
}
