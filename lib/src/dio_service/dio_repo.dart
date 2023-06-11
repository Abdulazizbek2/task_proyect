import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task_proyect/models/kitchen_card_model/kitchen_card_model.dart';

class Urls {
  static const baseUrl =
      'https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54';
}

class DioNetworkService {
  Dio? dio;
  DioNetworkService._private() {
    ///initialize dio
    dio = Dio();
    Log.log('DIO INITED');
  }
  static final _instance = DioNetworkService._private();
  factory DioNetworkService() {
    return _instance;
  }

  ///get NBU Json
  Future<List<KitchedCardModel?>?> getCardData() async {
    final datares = await dio!.get(Urls.baseUrl);
    Log.log(datares.toString());

    try {
      var uri = Uri.tryParse(Urls.baseUrl);

      var response = dio!.getUri<Map>(uri!);

      Log.log(response.toString());
      Response<Map> listResponse = await response;

      if (listResponse.statusCode == 200 || listResponse.statusCode == 201) {
        return List<KitchedCardModel?>.from(listResponse.data!["сategories"]
            .map((e) => KitchedCardModel.fromJson(e)));
      }
    } catch (e) {
      Log.log("EXCEPTION:::::$e");
    }
    return null;
  }
}

class Log {
  static void log(String s) {
    if (kDebugMode) {
      print(s);
    }
  }
}
