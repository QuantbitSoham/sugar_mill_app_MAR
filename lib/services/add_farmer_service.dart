import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:sugar_mill_app/constants.dart';
import 'package:sugar_mill_app/models/farmer.dart';
import '../models/aadharData_model.dart';
import '../models/bank_model.dart';
import '../models/village_model.dart';

class FarmerService {
  Future<List<villagemodel>> fetchVillages() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        apiVillageListGet,
        options: Options(
          method: 'GET',
          headers: {'Cookie': await getTocken()},
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
            'Error: ${e.response!.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return [];
  }

  Future<List<BankMaster>> fetchBanks() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Bank Master?fields=["bank_and_branch","branch","ifsc_code","name"]&limit_page_length=9999',
        options: Options(
          method: 'GET',
          headers: {'Cookie': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<BankMaster> dataList = List.from(jsonData['data'])
            .map<BankMaster>((data) => BankMaster.fromJson(data))
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
            'Error: ${e.response!.data["exception"].toString().split(":").elementAt(1).trim()}',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return [];
  }

  Future<bool> methodcall(String? docname) async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/method/sugar_mill.sugar_mill.doctype.farmer_list.farmer_list.vendor_code?docname=$docname',
        options: Options(
          method: 'POST',
          headers: {'Cookie': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i('vendor code generate');
        // Fluttertoast.showToast(msg: "vendor code genrated");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO vendor code genrated!");
        return false;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg: 'Error: ${e.response?.data["message"].toString()} ',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return false;
  }

  Future<bool> role() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/method/sugar_mill.sugar_mill.doctype.farmer_list.farmer_list.role',
        options: Options(
          method: 'GET',
          headers: {'Cookie': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        bool name = response.data["message"];
        // Logger().i('vendor code generate');
        // Fluttertoast.showToast(msg: "vendor code genrated");
        return name;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO vendor code genrated!");
        return false;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg: 'Error: ${e.response?.data["message"].toString()} ',
        textColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBA1A1A),
      );
      Logger().e(e.response?.data.toString());
    }
    return false;
  }

  Future<aadharData?> aadharCardData(var qrData) async {
    try {
      var data = {
        "qrData": qrData,
      };
      var dio = Dio();
      var response = await dio.request(
          '$apiBaseUrl/api/method/sugar_mill.sugar_mill.doctype.farmer_list.farmer_list.aadhardata',
          options: Options(
            method: 'GET',
            headers: {'Cookie': await getTocken()},
          ),
          data: data);

      if (response.statusCode == 200) {
        return aadharData.fromJson(response.data["message"]);
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO call aadhar");
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
          msg:
              "Please scan valid aadhar QR code ${e.response?.data["exception"]}");
      Logger().e(e.response?.data["exception"]);
    }
    return null;
  }

  Future<bool> addFarmer(Farmer farmer) async {
    var data = json.encode({
      "data": farmer,
    });
    Logger().i(data);
    try {
      var dio = Dio();
      var response = await dio.request(
        apiFarmerListPost,
        options: Options(
          method: 'POST',
          headers: {'Cookie': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        String name = response.data['data']['name'].toString();
        Logger().i(name);
        await FarmerService().methodcall(name);
        Fluttertoast.showToast(msg: "FARMER ADDED");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO ADD FARMER!");
        return false;
      }
    } catch (e) {
      if (e is DioException) {
        Fluttertoast.showToast(
            msg: "${e.response?.data["exception"].toString()}");
        Logger().e(e.message);
      } else {
        Fluttertoast.showToast(msg: "Error occurred $e");
        Logger().e(e);
      }
    }
    return false;
  }

  Future<String> uploadDocs(File? file) async {
    if (file == null) {
      return "";
    }
    try {
      FormData data = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: generateUniqueFileName(file),
        ),
      });
      var dio = Dio();
      var response = await dio.request(
        apiUploadFilePost,
        options: Options(
          method: 'POST',
          headers: {'Cookie': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Logger().i(json.encode(response.data));
        String jsonString = json
            .encode(response.data); // Convert the response.data to JSON string
        Map<String, dynamic> jsonResponse = json.decode(jsonString);

// Extract the "file_url" from the jsonResponse
        String fileUrl = jsonResponse["message"]["file_url"];
        return fileUrl;
      } else {
        Logger().i(response.statusMessage);
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
    return "";
  }

  Future<Farmer?> getFarmer(String id) async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Farmer List/$id',
        options: Options(
          method: 'GET',
          headers: {'Cookie': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        return Farmer.fromJson(response.data["data"]);
      } else {
        if (kDebugMode) {
          print(response.statusMessage);
        }
        return null;
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
    return null;
  }

  Future<bool> updateFarmer(Farmer farmer) async {
    try {
      // var data = json.encode({farmer});

      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Farmer List/${farmer.name}',
        options: Options(
          method: 'PUT',
          headers: {'Cookie': await getTocken()},
        ),
        data: farmer.toJson(),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "FARMER Updated");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO UPDATE FARMER!");
        return false;
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
    return false;
  }
}
