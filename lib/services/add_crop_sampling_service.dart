import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:sugar_mill_app/models/crop_sampling.dart';
import 'package:sugar_mill_app/models/sampling_formula.dart';

import '../constants.dart';
import '../models/agri_cane_model.dart';
import '../models/cane_farmer.dart';
import '../models/village_model.dart';

class AddCropSmaplingServices {
  Future<bool> addCropsampling(CropSampling cropsampling) async {
    var data = json.encode({
      "data": cropsampling,
    });
    Logger().i(cropsampling.toString());
    try {
      var dio = Dio();
      var response = await dio.request(
        apiPostCropSampling,
        options: Options(
          method: 'POST',
          headers: {'Authorization': await getToken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Crop Sampling  Registered Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO Crop Sampling!");
        return false;
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
    return false;
  }

  Future<bool> updateCropSampling(CropSampling cropsample) async {
    try {
      // var data = json.encode({farmer});
      Logger().i(cropsample.name.toString());
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Crop Sampling/${cropsample.name}',
        options: Options(
          method: 'PUT',
          headers: {'Authorization': await getToken()},
        ),
        data: cropsample.toJson(),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Crop Sampling Updated");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO UPDATE Crop Sampling!");
        return false;
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
    return false;
  }

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
        Fluttertoast.showToast(msg: "Unable to fetch Villages");
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

  Future<List<villagemodel>> fetchVillages() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Village?limit_page_length=999999&fields=["name","circle_office","taluka"]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<villagemodel> dataList = List.from(jsonData['data'])
            .map<villagemodel>((data) => villagemodel.fromJson(data))
            .toList();

        return dataList;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch Villages");
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

  Future<CropSampling?> getCropSampling(String? id) async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Crop Sampling/$id',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return CropSampling.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
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
    return null;
  }

  Future<List<AgriCane>> fetchcanelistwithfilter(
      String season, String village, String farmercode) async {
    try {

      var dio = Dio();
      var url =
          '$apiBaseUrl/api/resource/Cane Master?fields=["vendor_code","route_km","grower_name","grower_code","area","crop_type","crop_variety","plantattion_ratooning_date","area_acrs","plant_name","name","soil_type","season"]&filters=[["season","like","$season%"],["area","like","$village%"],["grower_code","like","$farmercode%"]]&limit_page_length=999999';
      var response = await dio.request(
        url,
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );
      Logger().i(url.toString());
      if (response.statusCode == 200) {
        var jsonData = json.encode(response.data);
        Map<String, dynamic> jsonDataMap = json.decode(jsonData);
        List<dynamic> dataList = jsonDataMap['data'];
        List<AgriCane> canelistwithfilter =
            dataList.map<AgriCane>((data) => AgriCane.fromJson(data)).toList();
        Logger().i(canelistwithfilter);
        return canelistwithfilter;
      } else {
        Logger().e(response.statusCode);
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

  Future<List<caneFarmer>> fetchfarmerListwithfilter(String village) async {
    try {

      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Farmer List?fields=["supplier_name","existing_supplier_code","village","name"]&limit_page_length=999999&filters=[["village","like","$village%"],["workflow_state","=","approved"]]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );
      if (response.statusCode == 200) {
        var jsonData = json.encode(response.data);
        Map<String, dynamic> jsonDataMap = json.decode(jsonData);
        List<dynamic> dataList = jsonDataMap['data'];
        List<caneFarmer> farmerList = dataList
            .map<caneFarmer>((data) => caneFarmer.fromJson(data))
            .toList();
        Logger().i(farmerList);
        return farmerList;
      } else {
        Logger().e(response.statusCode);
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

  Future<samplingformula?> fetchsamplingFormula() async {
    try {

      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Cane Sampling Formula/1',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getToken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return samplingformula.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
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
    return null;
  }
}
