import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../models/cane_master_report_model.dart';
import '../models/userwise_registration_model.dart';
import '../models/varietywiseregistration.dart';

class ReportServices {
  Future<List<String>> fetchSeason() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        apifetchSeason,
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
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
        Fluttertoast.showToast(msg: "Unable to fetch Season");
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:
            'Error: ${e.response?.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return [];
  }

  Future<List<UserWiseRegistrationModel>> fetchUserWiseRegistration(String season, String startDate, String endDate) async {
    try {
      var data = json.encode({
        "start_date": startDate,
        "end_date": endDate,
        "season": season,
      });
      Logger().i(data);
      var dio = Dio();
      var url =
          '$apiBaseUrl/api/method/sugar_mill.sugar_mill.app.run_userwise_registration_report';
      Logger().i(url);
      var response = await dio.request(url,
          options: Options(
            method: 'GET',
            headers: {'Authorization': await getToken()},
          ),
          data: data);
      if (response.statusCode == 200) {
        List<dynamic> jsonData =
            response.data['data']; // Extract the 'job_card' array
        List<UserWiseRegistrationModel> jobSummaries = [];
        Logger().i(jsonData);
        // Parse each item in the 'job_card' array
        for (var item in jsonData) {
          // Check if the item is a map (not the total summary at the end)
          if (item is Map<String, dynamic>) {
            jobSummaries.add(UserWiseRegistrationModel.fromJson(item));
          }
        }
        return jobSummaries;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch job cards");
        return [];
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        String errorMessage = e.response!.data.toString();
        Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          msg: 'Error: $errorMessage',
          textColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFFBA1A1A),
        );
        Logger().e(errorMessage);
      } else {
        // Handle Dio errors without response data
        Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          msg: 'Error: ${e.message}',
          textColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFFBA1A1A),
        );
        Logger().e(e.message);
      }
      return [];
    }
  }


  Future<CircleData?> fetchVarietyWiseRegistration(String season, String startDate, String endDate) async {
    try {
      var data = json.encode({
        "start_date": startDate,
        "end_date": endDate,
        "season": season,
      });
      Logger().i(data);
      var dio = Dio();
      var url =
          '$apiBaseUrl/api/method/sugar_mill.sugar_mill.app.run_varietywise_registration_report';
      Logger().i(url);
      var response = await dio.request(url,
          options: Options(
            method: 'GET',
            headers: {'Authorization': await getToken()},
          ),
          data: data);
      if (response.statusCode == 200) {
 // Extract the 'job_card' array
Logger().i(response.data['data']);
        return CircleData.fromJson(response.data["data"]);
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch job cards");
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        String errorMessage = e.response!.data.toString();
        Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          msg: 'Error: $errorMessage',
          textColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFFBA1A1A),
        );
        Logger().e(errorMessage);
      } else {
        // Handle Dio errors without response data
        Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          msg: 'Error: ${e.message}',
          textColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFFBA1A1A),
        );
        Logger().e(e.message);
      }
      return null;
    }
  }

  Future<List<CaneMasterReportModel>> fetchCaneRegistrationReport() async {
    try {
      var dio = Dio();
      var url =
          '$apiBaseUrl/api/method/sugar_mill.sugar_mill.app.run_cane_registration_report';
      Logger().i(url);
      var response = await dio.request(url,
          options: Options(
            method: 'GET',
            headers: {'Authorization': await getToken()},
          ),);
      if (response.statusCode == 200) {
        List<dynamic> jsonData =
        response.data['data']; // Extract the 'job_card' array
        List<CaneMasterReportModel> jobSummaries = [];
        Logger().i(jsonData);

        // Parse each item in the 'job_card' array
        for (var item in jsonData) {
          // Check if the item is a map (not the total summary at the end)
          if (item is Map<String, dynamic>) {
            jobSummaries.add(CaneMasterReportModel.fromJson(item));
          }
        }
        Logger().i(jobSummaries);
        return jobSummaries;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch job cards");
        return [];
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        String errorMessage = e.response!.data.toString();
        Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          msg: 'Error: $errorMessage',
          textColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFFBA1A1A),
        );
        Logger().e(errorMessage);
      } else {
        // Handle Dio errors without response data
        Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          msg: 'Error: ${e.message}',
          textColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFFBA1A1A),
        );
        Logger().e(e.message);
      }
      return [];
    }
  }
}
