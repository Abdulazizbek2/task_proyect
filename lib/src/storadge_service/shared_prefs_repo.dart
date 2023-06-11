import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<bool?> saveDataToLocal(
      {required String? key, required Map<int, int>? data}) async {
    try {
      print(1);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String encodedMap = json.encode(data);
      return prefs.setString(key!, encodedMap);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<Map<int, int>?> loadDataFromLocal(
      {required String? key}) async {
    try {
      print(1);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      print(2);

      String? encodedMap = prefs.getString(key!);
      print(3);

      Map<int, int>? decodedMap = json.decode(encodedMap!);
      print(4);

      return decodedMap;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
