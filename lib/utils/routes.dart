import 'package:cutomer_builder/utils/exports.dart';
import 'package:cutomer_builder/views/create_customer.dart';

import '../views/homepage.dart';

class AppPages {
  static const String loginPage = '/loginPage';
  static const String signupPage = '/signupPage';
  static const String home = '/home';
  static const String createCustomer = '/createCustomer';

  static List<GetPage<dynamic>> get routes {
    return [
      GetPage(
        name: AppPages.loginPage,
        page: () => const LoginPage(),
        binding: BindingsBuilder.put(() => LoginController()),
      ),
      GetPage(
        name: AppPages.signupPage,
        page: () => const SignUpPage(),
        binding: BindingsBuilder.put(() => SignUpController()),
      ),
      GetPage(
        name: AppPages.home,
        page: () => const HomePage(),
        binding: BindingsBuilder.put(() => HomeController()),
      ),
      GetPage(
        name: AppPages.createCustomer,
        page: () => const CreateCustomer(),
        binding: BindingsBuilder.put(() => CreateCustomerController()),
      ),
    ];
  }
}
