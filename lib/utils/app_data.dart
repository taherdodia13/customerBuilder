import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static bool get isUserLoggedIn =>
      _prefsInstance!.getBool("IsUserLoggedIn") ?? false;
  static set isUserLoggedIn(bool value) {
    _prefsInstance!.setBool("IsUserLoggedIn", value);
  }

  static String get email => _prefsInstance?.getString("email") ?? "";
  static set email(String value) => _prefsInstance?.setString("email", value);

  static int get userId => _prefsInstance?.getInt("userId") ?? 0;
  static set userId(int value) => _prefsInstance?.setInt("userId", value);

  static void clear() {
    _prefsInstance?.clear();
  }
}
