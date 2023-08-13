import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/photo/domain/entities/user.dart';

class CustomSharedPreferences {
  static saveUser(String key, User value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value).toString());
  }

  static readUser(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(key) != null) {
      return json.decode(prefs.getString(key)!);
    }
  }
}
