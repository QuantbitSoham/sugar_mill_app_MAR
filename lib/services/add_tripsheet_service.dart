import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:sugar_mill_app/models/trip_crop_harvesting_model.dart';
import 'package:sugar_mill_app/models/tripsheet.dart';
import 'package:sugar_mill_app/models/tripsheet_master.dart';
import '../constants.dart';
import '../models/cartlist.dart';



class AddTripSheetServices {
  Future<Tripsheet?> getTripsheet(String id) async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Trip Sheet/$id',
        options: Options(
          method: 'GET',
          headers: {'Cookie': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return Tripsheet.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    }on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["exception"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }
    return null;
  }

  Future<bool> updateTrip(Tripsheet trip) async {
    try {
      // var data = json.encode({farmer});
      Logger().i(trip.name.toString());
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Trip Sheet/${trip.name.toString()}',
        options: Options(
          method: 'PUT',
          headers: {'Cookie': await getTocken()},
        ),
        data: trip.toJson(),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Trip Sheet Updated");
        return true;
      } else {
        Fluttertoast.showToast(msg: "Unable to Update Tripsheet!");
        return false;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["exception"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }

return false;
  }

  Future<bool> addTripSheet(Tripsheet trip) async {
    var data = json.encode({
      "data": trip,
    });
    Logger().i(trip.toString());
    try {
      var dio = Dio();
      var response = await dio.request(
        apifetchtripsheetData,
        options: Options(
          method: 'POST',
          headers: {'Cookie': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Trip Sheet Added Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "Unable to add Trip Sheet!");
        return false;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        Fluttertoast.showToast(msg: 'Tripsheet of ${trip.slipNo} slip no is already exists.');
        Logger().e(e.response?.statusCode);
        return false;
      } else {
        Fluttertoast.showToast(msg: e.response?.data['exception']);
        Logger().e(e.response?.statusCode);
        return false;
      }

    }

  }

  Future<TripSheetMasters?> getMasters() async {
    try {
      var dio = Dio();
      var response = await dio.request(
          '$apiBaseUrl/api/method/sugar_mill.sugar_mill.app.tripSheetMasters',
          options: Options(
            method: 'GET',
            headers: {'Cookie': await getTocken()},
          ),
      );
      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return TripSheetMasters.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["message"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }
    return null;
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
        Fluttertoast.showToast(msg: "Unable to fetch Villages");
        return [];
      }
    }on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["exception"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    } return[];
  }



  Future<CartInfo?> cartinfo(String id) async {
    var data = {
      'cartno': id
    };
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/method/sugar_mill.sugar_mill.doctype.trip_sheet.trip_sheet.cartlist',
        options: Options(
          method: 'GET',
          headers: {'Cookie': await getTocken()},
        ),
        data:data
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["message"]);
        return CartInfo.fromJson(response.data["message"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["message"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }
    return null;
  }

  Future<List<CropHarvestingModel>> fetchPlot(String? season) async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Crop Harvesting?fields=["id","grower_code","grower_name","area","crop_variety","plantattion_ratooning_date","survey_number","area_acrs","name","route","route_km","vendor_code"]&filters=[["season","like","$season%"]]&limit_page_length=9999999',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<CropHarvestingModel> routeList = List.from(jsonData['data'])
            .map<CropHarvestingModel>(
                (data) => CropHarvestingModel.fromJson(data))
            .toList();
        Logger().i(routeList.toString());
        return routeList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    }on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["exception"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }

    return [];
  }

  Future<List<String>> fetchPlant() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        apifetchPlant,
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
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["exception"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }
    return [];
  }

  Future<List<CaneRoute>> fetchRoute() async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        apifetchroute,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<CaneRoute> routeList = List.from(jsonData['data'])
            .map<CaneRoute>((data) => CaneRoute.fromJson(data))
            .toList();
        return routeList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["exception"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }

    return [];
  }

  Future<List<TransportInfo>> fetchTransport() async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        apifetchtransportinfo,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<TransportInfo> routeList = List.from(jsonData['data'])
            .map<TransportInfo>((data) => TransportInfo.fromJson(data))
            .toList();
        return routeList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["exception"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }

    return [];
  }

  Future<List<WaterSupplierList>> fetchWaterSupplier() async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        apifetchFarList,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<WaterSupplierList> routeList = List.from(jsonData['data'])
            .map<WaterSupplierList>((data) => WaterSupplierList.fromJson(data))
            .toList();
        return routeList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["exception"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }

    return [];
  }
}
