import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../models/tripsheet_list_search.dart';

class ListTripshhetService {
  Future<List<TripSheetSearch>> getAllTripsheetList() async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        apifetchtripsheetsearch,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<TripSheetSearch> caneList = List.from(jsonData['data'])
            .map<TripSheetSearch>((data) => TripSheetSearch.fromJson(data))
            .toList();
        return caneList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:
            'Error: ${e.response!.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return [];
  }

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
        Fluttertoast.showToast(msg: "Unable to fetch Season");
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:
            'Error: ${e.response!.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return [];
  }

  Future<List<TripSheetSearch>> getAllTripsheetListfilter(
      String query, String filter) async {
    try {
      var headers = {'Cookie': await getTocken()};

      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Trip Sheet?fields=["name","slip_no","farmer_name","field_village","transporter_name","circle_office","season","slip_no"]&filters=[["$query","like","$filter%"]]&order_by=creation desc',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      Logger().i(query);
      Logger().i(filter);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<TripSheetSearch> caneList = List.from(jsonData['data'])
            .map<TripSheetSearch>((data) => TripSheetSearch.fromJson(data))
            .toList();
        return caneList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:
            'Error: ${e.response!.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return [];
  }

  Future<List<TripSheetSearch>> getTransporterNameFilter(
      String trsname, String village, String season) async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Trip Sheet?fields=["name","slip_no","farmer_name","field_village","transporter_name","circle_office","season"]&filters=[["farmer_name","like","%$trsname%"],["field_village","like","$village%"],["season","like","$season%"]]&order_by=creation desc',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      Logger().i(response);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<TripSheetSearch> farmersList = List.from(jsonData['data'])
            .map<TripSheetSearch>((data) => TripSheetSearch.fromJson(data))
            .toList();
        return farmersList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:
            'Error: ${e.response!.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }

    return [];
  }
}
