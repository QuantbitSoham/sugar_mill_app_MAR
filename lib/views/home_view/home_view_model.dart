import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:sugar_mill_app/models/checkin.dart';
import 'package:sugar_mill_app/models/employee.dart';
import 'package:sugar_mill_app/router.router.dart';
import 'package:sugar_mill_app/services/chekin_Services.dart';
import 'package:sugar_mill_app/services/geolocation_service.dart';
import '../../models/dashboard_model.dart';
import '../../services/login_success.dart';

class HomeViewModel extends BaseViewModel {
  Checkin checkindata = Checkin();
  Employee employee = Employee();
  Dashboard dashboard=Dashboard();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  List<String> villageList = [""];
  List<Employee> empList = [];
  List<Checkin> checkinList = [];

   String? greeting;
  String? imageurl;

  void logout(BuildContext context) async {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    prefs.clear();
    if (context.mounted) {
      Navigator.popAndPushNamed(context, Routes.loginViewScreen);
    }
  }



  initialise(BuildContext context) async {
    setBusy(true);
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    villageList = await login().fetchVillages();
    if (villageList.isEmpty) {
      final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
      final SharedPreferences prefs = await prefs0;
      prefs.clear();
      if (context.mounted) {
        Navigator.popAndPushNamed(context, Routes.loginViewScreen);
      }
    }
handleGreeting();
handleImage();
dashboard=await CheckInServices().dashboard() ?? Dashboard();
    setBusy(false);
  }


 void handleGreeting() {
    final now = DateTime.now();
    final timeOfDay = now.hour;
    if (timeOfDay < 12) {
      greeting = "Good Morning,";
    } else if (timeOfDay < 17) {
      greeting = "Good Afternoon,";
    } else {
      greeting = "Good Evening,";
    }
  }
  void handleImage() {
    final now = DateTime.now();
    final timeOfDay = now.hour;
    if (timeOfDay < 12) {
      imageurl = "assets/images/morning.png";
    } else if (timeOfDay < 17) {
      imageurl = "assets/images/afternoon.png";
    } else {
      imageurl = "assets/images/sunset.png";
    }
  }

  void employeeLog(String logtype, BuildContext context) async {
    setBusy(true);
    GeolocationService geolocationService = GeolocationService();
    try {
      Position? position = await geolocationService.determinePosition();


      if (position == null) {
        Fluttertoast.showToast(msg: 'Failed to get location');
        return setBusy(false);
      }

      Placemark? placemark = await geolocationService.getPlacemarks(position);
      if (placemark == null) {
        Fluttertoast.showToast(msg: 'Failed to get placemark');
        return setBusy(false);
      }

      String formattedAddress =
          await geolocationService.getAddressFromCoordinates(
              position.latitude, position.longitude) ??
              "";
      checkindata.latitude = position.latitude.toString();
      checkindata.longitude = position.longitude.toString();
      checkindata.deviceId = formattedAddress;
      Logger().i(position.latitude.toString());
      Logger().i(position.longitude.toString());
      Logger().i(formattedAddress);

      bool res = await CheckInServices().addCheckIn(logtype,position.latitude.toString(),position.longitude.toString(),formattedAddress);
      if (res) {
        setBusy(false);
        dashboard=await CheckInServices().dashboard() ?? Dashboard();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    } finally {
      setBusy(false);
    }
    setBusy(false);
    notifyListeners();
  }


}
