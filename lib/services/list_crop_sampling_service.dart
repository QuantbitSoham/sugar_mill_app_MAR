import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../models/list_crop_sampling_model.dart';

class ListCropSamplingServices {
  Future<List<ListSampling>> getAllCropSamplingList() async {
    try {
      
      var dio = Dio();
      var response = await dio.request(
        apiListSampling,
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<ListSampling> caneList = List.from(jsonData['data'])
            .map<ListSampling>((data) => ListSampling.fromJson(data))
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
            'Error: ${e.response?.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return [];
  }

  Future<List<ListSampling>> getAllCompletedCropSamplingList() async {
    try {
      
      var dio = Dio();
      var response = await dio.request(
        apiCompletedListSampling,
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<ListSampling> caneList = List.from(jsonData['data'])
            .map<ListSampling>((data) => ListSampling.fromJson(data))
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
            'Error: ${e.response?.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return [];
  }

  Future<List<ListSampling>> filterListBySeason(String season) async {
    try {
      
      var url =
          '$apiBaseUrl/api/resource/Crop Sampling?order_by=creation desc&fields=["id","plot_no","plantattion_ratooning_date","average_brix","grower_name","route","form_number","crop_variety","name","area"]&filters=[["season","like","$season%"],["plantation_status","=","To Sampling"]]&order_by=creation desc';
      var dio = Dio();
      var response = await dio.request(
        url,
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );
      Logger().i(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<ListSampling> caneList = List.from(jsonData['data'])
            .map<ListSampling>((data) => ListSampling.fromJson(data))
            .toList();
        Logger().i(caneList);
        return caneList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:
            'Error: ${e.response?.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }

    return [];
  }

  Future<List<ListSampling>> filterCompletedListBySeason(String season) async {
    try {
      
      var url =
          '$apiBaseUrl/api/resource/Crop Sampling?fields=["id","plot_no","plantattion_ratooning_date","average_brix","grower_name","route","form_number","crop_variety","name","area"]&filters=[["season","like","$season%"],["plantation_status","=","To Harvesting"]]&order_by=creation desc';
      var dio = Dio();
      var response = await dio.request(
        url,
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );
      Logger().i(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<ListSampling> caneList = List.from(jsonData['data'])
            .map<ListSampling>((data) => ListSampling.fromJson(data))
            .toList();
        Logger().i(caneList);
        return caneList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:
            'Error: ${e.response?.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }

    return [];
  }

  Future<List<ListSampling>> getListByvillagefarmernameFilter(
      String village, String name) async {
    try {
      

      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Crop Sampling?fields=["id","plot_no","plantattion_ratooning_date","average_brix","grower_name","route","form_number","crop_variety","name","area"]&filters=[["area","Like","$village%"],["grower_name","Like","%$name%"],["plantation_status","=","To Sampling"]]&order_by=creation desc',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );
      Logger().i(response);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<ListSampling> caneList = List.from(jsonData['data'])
            .map<ListSampling>((data) => ListSampling.fromJson(data))
            .toList();
        Logger().i(caneList);
        return caneList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:
            'Error: ${e.response?.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }

    return [];
  }

  Future<List<ListSampling>> getCompletedListByvillagefarmernameFilter(
      String village, String name) async {
    try {
      

      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Crop Sampling?fields=["id","plot_no","plantattion_ratooning_date","average_brix","grower_name","route","form_number","crop_variety","name","area"]&filters=[["area","Like","$village%"],["grower_name","Like","%$name%"],["plantation_status","=","To Harvesting"]]&order_by=creation desc',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );
      Logger().i(response);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<ListSampling> caneList = List.from(jsonData['data'])
            .map<ListSampling>((data) => ListSampling.fromJson(data))
            .toList();
        Logger().i(caneList);
        return caneList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg:
            'Error: ${e.response?.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }

    return [];
  }
}
