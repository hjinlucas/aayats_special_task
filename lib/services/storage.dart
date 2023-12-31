import 'package:shared_preferences/shared_preferences.dart';

import '../constants/exports.dart';

class StorageService {
  late final SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return _pref.getString(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(Constants.STORAGE_DEVICE_OPEN_FIRST_TIME_KEY) ?? false;
  }

  bool isLoggedIn() {
    return _pref.getString(Constants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }
}
