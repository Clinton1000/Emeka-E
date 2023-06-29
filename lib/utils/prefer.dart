// ignore_for_file: avoid_print, constant_identifier_names

import 'package:changecollect/main.dart';

class Prefs {
  static const String USER_ID = 'userId';
  static const String KEY_TOKEN = 'TOKEN';

  static setString(String key, String value) {
    return getStorage.write(key, value);
  }

  static getString(String key) {
    return getStorage.read(key) ?? '';
  }

  static String getToken() {
    return getStorage.read(KEY_TOKEN) ?? '';
  }

  static setToken(String token) {
    return getStorage.write(KEY_TOKEN, token);
  }

  static String getUserID() {
    return getStorage.read(USER_ID) ?? '';
  }

  static setUserID(String userID) {
    return getStorage.write(USER_ID, userID);
  }

  static remove(String key) {
    return getStorage.remove(key);
  }

  static clear() {
    print('PREFS CLEARED');
    return getStorage.erase();
  }
}
