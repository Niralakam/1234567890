import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;
  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  dynamic getAll(String key) {
    var value = _preferences.get(key);
    if (value.runtimeType == String) {
      value = jsonDecode(value);
    }
    return value;
  }

  String get(String key, String parameter) {
    var value = _preferences.get(key);
    var token;
    if (value.runtimeType == String) {
      value = jsonDecode(value);
      token = value[parameter] ?? "";
    }
    return token;
  }

  bool isHaveToken(String key) {
    var value = _preferences.get(key);
    var isToken = false;
    if (value.runtimeType == String) {
      value = jsonDecode(value);
      var token = value["token"] ?? "";
      isToken = token == "" ? false : true;
    }
    return isToken;
  }

  bool isAdmin(String key) {
    var value = _preferences.get(key);
    var isAdmin = false;
    if (value.runtimeType == String) {
      value = jsonDecode(value);
      var adminuser = value["isAdminuser"] ?? "";
      isAdmin = adminuser == "" ? false : true;
    }
    return isAdmin;
  }

  void saveStringToDisk(String key, String content) {
    _preferences.setString(key, content);
  }

  void set(String key, String content) {
    _preferences.setString(key, content);
  }

  void remove(String key) {
    _preferences.remove(key);
  }
}
