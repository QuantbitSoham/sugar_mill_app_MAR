import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:sugar_mill_app/models/checkin.dart';
import '../constants.dart';
import '../models/dashboard_model.dart';
import '../models/employee.dart';

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
      Logger().i(e.response);
      // Fluttertoast.showToast(msg: "Error while fetching user");
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
    } catch (e) {
      Fluttertoast.showToast(msg: "Error accoured $e ");
      Logger().e(e);
    }
    return false;
  }


}
