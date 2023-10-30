import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharePrefrences;
  static init() async {
    sharePrefrences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBool(
      {required String key, required bool value}) async {
    return await sharePrefrences!.setBool(key, value);
  }

  static bool? getData({
    required String key,
  }) {
    return sharePrefrences!.getBool(key);
  }
}
