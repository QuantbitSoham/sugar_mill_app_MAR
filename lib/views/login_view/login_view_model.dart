import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/router.router.dart';
import 'package:sugar_mill_app/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  var fcmToken = "";
  bool obscurePassword = true;
  bool isloading = false;
  bool rememberMe = false;
  Future<void> initialise() async{
    rememberMe=true;
    _getToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rememberMe = prefs.getBool('rememberMe') ?? false;
    if (rememberMe) {
      usernameController.text = prefs.getString('username') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
      Logger().i(usernameController.text);Logger().i(passwordController.text);Logger().i(rememberMe);
    }
    notifyListeners();
  }

  Future<void> _getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      fcmToken = token!;
      print("FCM Token: $token");
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void changeRememberMe(bool? value) {
    rememberMe = value ?? false;
    notifyListeners();
  }
  void loginwithUsernamePassword(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isloading = true;
      notifyListeners();
      String username = usernameController.text;
      String password = passwordController.text;
      Logger().i(username);
      Logger().i(password);
      bool res = await Authentication().login(username, password,fcmToken);
      isloading = false;
      notifyListeners();
      if (res) {
        if (rememberMe) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', usernameController.text);
          await prefs.setString('password', passwordController.text);
          await prefs.setBool('rememberMe', true);
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('username');
          await prefs.remove('password');
          await prefs.setBool('rememberMe', false);
        }
        if (context.mounted) {
          Navigator.popAndPushNamed(context, Routes.homePageScreen);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Invalid Credentials",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.redAccent,showCloseIcon: true,
          content:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.wifi_off_sharp,color: Colors.white,size: 25,),
              SizedBox(width: 20,),
              Text('Please connect your device to the internet',style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
      );
    }
  }

  String? validateUsername(username) {
    if (username.toString().isEmpty) {
      return "Enter a valid username";
    }
    return null;
  }

  String? validatePassword(password) {
    if (password.toString().isEmpty) {
      return "Enter a Password";
    }
    return null;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
