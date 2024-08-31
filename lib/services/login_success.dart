import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import '../constants.dart';

class login {
  Future<List<String>> fetchSeason() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        apifetchSeason,
        options: Options(
          method: 'GET',
          headers: {'Cookie': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        var jsonData = json.encode(response.data);
        Map<String, dynamic> jsonDataMap = json.decode(jsonData);
        List<dynamic> dataList = jsonDataMap["data"];
        Logger().i(dataList);
        List<String> namesList =
            dataList.map((item) => item["name"].toString()).toList();
        return namesList;
      }

      if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: "Unauthorized Access!");
        return ["401"];
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch Villages");
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg: 'Error: ${e.response?.data["exception"].toString()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
      return [];
    }
  }
}
