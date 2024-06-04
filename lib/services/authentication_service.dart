import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugar_mill_app/constants.dart';


class Authentication {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> login(String username, String password) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    // var data = {'usr': 'nishant.shingate@erpdata.in', 'pwd': 'Admin@123'};
    var data = {'usr': username, 'pwd': password};
    var dio = Dio();
    Logger().i(apiLoginGet);
    try {
      var response = await dio.request(
        apiLoginGet,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await _prefs;
        Logger().i(response.headers["set-cookie"]);
        prefs.setString("Cookie", response.headers["set-cookie"].toString());
        prefs.setString("mobile", username);
        Logger().i(json.encode(response.data));
        Logger().i(username);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      // Fluttertoast.showToast(gravity:ToastGravity.BOTTOM,msg: 'Error: ${e.response?.data["exception"].toString()} ',textColor:Color(0xFFFFFFFF),backgroundColor: Color(0xFFBA1A1A),);
      Logger().e(e.response?.data.toString());

    }
    return false;
  }
}
