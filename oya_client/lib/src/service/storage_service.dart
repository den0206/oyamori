import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey { steps }

extension StorageKeyEXT on StorageKey {
  String get keyString {
    switch (this) {
      case StorageKey.steps:
        return "steps";
    }
  }

  Future<bool> saveString(dynamic value) async {
    final pref = await SharedPreferences.getInstance();
    final encoded = json.encode(value);
    return pref.setString(keyString, encoded);
  }

  Future<dynamic> loadString() async {
    final pref = await SharedPreferences.getInstance();
    final value = pref.getString(keyString);
    if (value == null) {
      print("No Local Storage");
      return null;
    }
    final decoded = json.decode(value);
    return decoded;
  }

  Future<bool> saveInt(int value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt(keyString, value);
  }

  Future<dynamic> loadInt() async {
    final pref = await SharedPreferences.getInstance();
    final value = pref.getInt(keyString);
    if (value == null) {
      print("No Local Storage");
      return null;
    }
    return value;
  }

  Future<bool> saveNumbers(List<int> value) async {
    final pref = await SharedPreferences.getInstance();
    List<String> strList = value.map((i) => i.toString()).toList();
    return await pref.setStringList(keyString, strList);
  }

  Future<List<int>> loadNumbers() async {
    final pref = await SharedPreferences.getInstance();
    final List<String>? strList = pref.getStringList(keyString);
    if (strList == null) return [];
    return strList.map((i) => int.parse(i)).toList();
  }

  Future<bool> saveBool(bool value) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.setBool(keyString, value);
  }

  Future<bool?> loadBool() async {
    final pref = await SharedPreferences.getInstance();
    final value = pref.getBool(keyString);
    return value;
  }

  Future<bool> deleteLocal() async {
    final pref = await SharedPreferences.getInstance();
    return await pref.remove(keyString);
  }
}

Future<void> deleteAllStorage() async {
  final pref = await SharedPreferences.getInstance();

  await pref.clear();
}
