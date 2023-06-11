import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<bool?> saveDataToLocal(
      {required String? key, required Map<String, dynamic>? data}) async {
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

  static Future<Map<String, dynamic>?> loadDataFromLocal(
      {required String? key}) async {
    try {
      print(1);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      print(2);

      String? encodedMap = prefs.getString(key!);
      print(3);
      print(encodedMap);
      Map<String, dynamic> decodedMap = json.decode(encodedMap!);
      print(decodedMap);

      return decodedMap;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
