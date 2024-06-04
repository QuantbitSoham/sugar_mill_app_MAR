import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import '../constants.dart';
import '../models/dashboard_model.dart';

class CheckInServices {

  Future<Dashboard?> dashboard() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/method/sugar_mill.sugar_mill.app.get_dashboard',
        options: Options(
          method: 'GET',
          headers: {'Cookie': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return Dashboard.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    } on DioException catch (e) {
      // Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["message"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }
    return null;
  }

  Future<bool> addCheckIn(String logtype,String latitude,String longitude,String address) async {
    var data = {
      "log_type": logtype,
      "latitude":latitude,
      "longitude":longitude,
      "address":address
    };
    Logger().i(data.toString());
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/method/sugar_mill.sugar_mill.app.create_employee_log',
        options: Options(
          method: 'POST',
          headers: {'Cookie': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Logger().i("check Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO checkin");
        return false;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["message"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }
    return false;
  }


}
