import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugar_mill_app/constants.dart';

class Authentication {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> login(String username, String password,String token) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    // var data = {'usr': 'nishant.shingate@erpdata.in', 'pwd': 'Admin@123'};
    var data = {'usr': username, 'pwd': password, 'token': token};
    var dio = Dio();
    var apiUrl='$apiBaseUrl/api/method/sugar_mill.sugar_mill.app.login';
    Logger().i(apiUrl);
    try {
      var response = await dio.request(
        apiUrl,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await _prefs;
        Logger().i(response.data.toString());
        prefs.setString("api_secret",
            response.data["key_details"]["api_secret"].toString());
        prefs.setString(
            "api_key", response.data["key_details"]["api_key"].toString());
        prefs.setString("user", response.data["user"].toString());
        Logger().i(prefs.getString('api_secret'));
        Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Logged in successfully',textColor:Color(0xFFFFFFFF),backgroundColor: Color.fromARGB(255, 26, 186, 82),);
        return true;
      } else {
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
      return false;
    }
  }
}
