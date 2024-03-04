import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._init() {
    _initSharedPref();
  }

  static final _inctance = SharedPref._init();
  late SharedPreferences _preferences;

  factory SharedPref() {
    return _inctance;
  }

  Future<void> _initSharedPref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setBool({required String key, required bool value}) async {
    await _preferences.setBool(key, value);
  }

  bool getBool({required String key}) {
    return _preferences.getBool(key) ?? false;
  }
}
