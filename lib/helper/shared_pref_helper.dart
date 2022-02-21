import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static Future<void> clearAllPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> clearPrefForKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<bool?> getBoolPrefFor({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    var value = prefs.getBool(key);
    print('Getting bool: $value for key: $key now');
    return value;
  }

  static Future<String?> getStringPrefFor({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(key);
    // print('Getting string: $value for key: $key now');
    return value;
  }


  static Future<bool> isSessionExist() async {
    // print('isSessionExist');
    var _isSessionExist = false;
   //TODO here to check session
    return _isSessionExist;
  }

  static Future<void> saveBoolFor({
    required String key,
    required bool value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    print('Saving bool: $value for key: $key');
    await prefs.setBool(key, value);
  }

  static Future saveStringFor({
    required String key,
    required String value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    print('Saving string: $value for key: $key');
    await prefs.setString(key, value);
  }
}