// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i21;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i23;
import 'package:sugar_mill_app/models/aadharData_model.dart' as _i22;
import 'package:sugar_mill_app/views/agriculture_screens/add_agri_view/add_agri_screen.dart'
    as _i9;
import 'package:sugar_mill_app/views/agriculture_screens/list_agri_view/list_agri_screen.dart'
    as _i10;
import 'package:sugar_mill_app/views/cane_screens/add_cane_view/add_cane_screen.dart'
    as _i7;
import 'package:sugar_mill_app/views/cane_screens/list_cane_view/list_cane_screen.dart'
    as _i8;
import 'package:sugar_mill_app/views/Crop_Sampling_screens/add_sampling_view/add_crop_sampling_screen.dart'
    as _i11;
import 'package:sugar_mill_app/views/Crop_Sampling_screens/list_completed_sampling_view/list_Completed_sampling_screen.dart'
    as _i13;
import 'package:sugar_mill_app/views/Crop_Sampling_screens/list_sampling_view/list_sampling_screen.dart'
    as _i12;
import 'package:sugar_mill_app/views/farmer_screens/add_farmer_view/add_farmer_screen.dart'
    as _i5;
import 'package:sugar_mill_app/views/farmer_screens/list_farmers_view/list_farmers_screen.dart'
    as _i6;
import 'package:sugar_mill_app/views/home_view/home_view_screen.dart' as _i3;
import 'package:sugar_mill_app/views/login_view/login_view_screen.dart' as _i4;
import 'package:sugar_mill_app/views/reports/Cane%20Registration%20Report/cane_registration_screen.dart'
    as _i18;
import 'package:sugar_mill_app/views/reports/report_screen.dart' as _i17;
import 'package:sugar_mill_app/views/reports/userwise%20cane%20register/userwise_registration_screen.dart'
    as _i16;
import 'package:sugar_mill_app/views/reports/varitywise%20cane%20registration%20data/varietywise_cane_registration_screen.dart'
    as _i19;
import 'package:sugar_mill_app/views/reports/yard_balance/yard_balane_screen.dart'
    as _i20;
import 'package:sugar_mill_app/views/splash_screen_view/splash_screen.dart'
    as _i2;
import 'package:sugar_mill_app/views/tripsheet_screen/add_tripsheet_list/add_tripsheet_list_screen.dart'
    as _i15;
import 'package:sugar_mill_app/views/tripsheet_screen/add_tripsheet_view/add_tripsheet_screen.dart'
    as _i14;

class Routes {
  static const splashScreen = '/';

  static const homePageScreen = '/home-page-screen';

  static const loginViewScreen = '/login-view-screen';

  static const addFarmerScreen = '/add-farmer-screen';

  static const listFarmersScreen = '/list-farmers-screen';

  static const addCaneScreen = '/add-cane-screen';

  static const listCaneScreen = '/list-cane-screen';

  static const addAgriScreen = '/add-agri-screen';

  static const listAgriScreen = '/list-agri-screen';

  static const addCropSamplingScreen = '/add-crop-sampling-screen';

  static const listSamplingScreen = '/list-sampling-screen';

  static const listCompletedSamplingScreen = '/list-completed-sampling-screen';

  static const addTripSheetScreen = '/add-trip-sheet-screen';

  static const tripsheetMaster = '/tripsheet-master';

  static const userWiseRegistrationReport = '/user-wise-registration-report';

  static const reportScreen = '/report-screen';

  static const caneRegistrationReport = '/cane-registration-report';

  static const varietyWiseCaneRegistrationReport =
      '/variety-wise-cane-registration-report';

  static const yardBalaneScreen = '/yard-balane-screen';

  static const all = <String>{
    splashScreen,
    homePageScreen,
    loginViewScreen,
    addFarmerScreen,
    listFarmersScreen,
    addCaneScreen,
    listCaneScreen,
    addAgriScreen,
    listAgriScreen,
    addCropSamplingScreen,
    listSamplingScreen,
    listCompletedSamplingScreen,
    addTripSheetScreen,
    tripsheetMaster,
    userWiseRegistrationReport,
    reportScreen,
    caneRegistrationReport,
    varietyWiseCaneRegistrationReport,
    yardBalaneScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreen,
      page: _i2.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.homePageScreen,
      page: _i3.HomePageScreen,
    ),
    _i1.RouteDef(
      Routes.loginViewScreen,
      page: _i4.LoginViewScreen,
    ),
    _i1.RouteDef(
      Routes.addFarmerScreen,
      page: _i5.AddFarmerScreen,
    ),
    _i1.RouteDef(
      Routes.listFarmersScreen,
      page: _i6.ListFarmersScreen,
    ),
    _i1.RouteDef(
      Routes.addCaneScreen,
      page: _i7.AddCaneScreen,
    ),
    _i1.RouteDef(
      Routes.listCaneScreen,
      page: _i8.ListCaneScreen,
    ),
    _i1.RouteDef(
      Routes.addAgriScreen,
      page: _i9.AddAgriScreen,
    ),
    _i1.RouteDef(
      Routes.listAgriScreen,
      page: _i10.ListAgriScreen,
    ),
    _i1.RouteDef(
      Routes.addCropSamplingScreen,
      page: _i11.AddCropSamplingScreen,
    ),
    _i1.RouteDef(
      Routes.listSamplingScreen,
      page: _i12.ListSamplingScreen,
    ),
    _i1.RouteDef(
      Routes.listCompletedSamplingScreen,
      page: _i13.ListCompletedSamplingScreen,
    ),
    _i1.RouteDef(
      Routes.addTripSheetScreen,
      page: _i14.AddTripSheetScreen,
    ),
    _i1.RouteDef(
      Routes.tripsheetMaster,
      page: _i15.TripsheetMaster,
    ),
    _i1.RouteDef(
      Routes.userWiseRegistrationReport,
      page: _i16.UserWiseRegistrationReport,
    ),
    _i1.RouteDef(
      Routes.reportScreen,
      page: _i17.ReportScreen,
    ),
    _i1.RouteDef(
      Routes.caneRegistrationReport,
      page: _i18.CaneRegistrationReport,
    ),
    _i1.RouteDef(
      Routes.varietyWiseCaneRegistrationReport,
      page: _i19.VarietyWiseCaneRegistrationReport,
    ),
    _i1.RouteDef(
      Routes.yardBalaneScreen,
      page: _i20.YardBalaneScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreen(),
        settings: data,
      );
    },
    _i3.HomePageScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomePageScreen(),
        settings: data,
      );
    },
    _i4.LoginViewScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginViewScreen(),
        settings: data,
      );
    },
    _i5.AddFarmerScreen: (data) {
      final args = data.getArgs<AddFarmerScreenArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.AddFarmerScreen(
            key: args.key, farmerid: args.farmerid, qrdata: args.qrdata),
        settings: data,
      );
    },
    _i6.ListFarmersScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ListFarmersScreen(),
        settings: data,
      );
    },
    _i7.AddCaneScreen: (data) {
      final args = data.getArgs<AddCaneScreenArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.AddCaneScreen(key: args.key, caneId: args.caneId),
        settings: data,
      );
    },
    _i8.ListCaneScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ListCaneScreen(),
        settings: data,
      );
    },
    _i9.AddAgriScreen: (data) {
      final args = data.getArgs<AddAgriScreenArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.AddAgriScreen(key: args.key, agriId: args.agriId),
        settings: data,
      );
    },
    _i10.ListAgriScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ListAgriScreen(),
        settings: data,
      );
    },
    _i11.AddCropSamplingScreen: (data) {
      final args = data.getArgs<AddCropSamplingScreenArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.AddCropSamplingScreen(
            key: args.key, samplingId: args.samplingId),
        settings: data,
      );
    },
    _i12.ListSamplingScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ListSamplingScreen(),
        settings: data,
      );
    },
    _i13.ListCompletedSamplingScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.ListCompletedSamplingScreen(),
        settings: data,
      );
    },
    _i14.AddTripSheetScreen: (data) {
      final args = data.getArgs<AddTripSheetScreenArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.AddTripSheetScreen(key: args.key, tripId: args.tripId),
        settings: data,
      );
    },
    _i15.TripsheetMaster: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.TripsheetMaster(),
        settings: data,
      );
    },
    _i16.UserWiseRegistrationReport: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.UserWiseRegistrationReport(),
        settings: data,
      );
    },
    _i17.ReportScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.ReportScreen(),
        settings: data,
      );
    },
    _i18.CaneRegistrationReport: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.CaneRegistrationReport(),
        settings: data,
      );
    },
    _i19.VarietyWiseCaneRegistrationReport: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.VarietyWiseCaneRegistrationReport(),
        settings: data,
      );
    },
    _i20.YardBalaneScreen: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.YardBalaneScreen(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddFarmerScreenArguments {
  const AddFarmerScreenArguments({
    this.key,
    required this.farmerid,
    required this.qrdata,
  });

  final _i21.Key? key;

  final String farmerid;

  final _i22.aadharData qrdata;

  @override
  String toString() {
    return '{"key": "$key", "farmerid": "$farmerid", "qrdata": "$qrdata"}';
  }

  @override
  bool operator ==(covariant AddFarmerScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.farmerid == farmerid &&
        other.qrdata == qrdata;
  }

  @override
  int get hashCode {
    return key.hashCode ^ farmerid.hashCode ^ qrdata.hashCode;
  }
}

class AddCaneScreenArguments {
  const AddCaneScreenArguments({
    this.key,
    required this.caneId,
  });

  final _i21.Key? key;

  final String caneId;

  @override
  String toString() {
    return '{"key": "$key", "caneId": "$caneId"}';
  }

  @override
  bool operator ==(covariant AddCaneScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.caneId == caneId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ caneId.hashCode;
  }
}

class AddAgriScreenArguments {
  const AddAgriScreenArguments({
    this.key,
    required this.agriId,
  });

  final _i21.Key? key;

  final String agriId;

  @override
  String toString() {
    return '{"key": "$key", "agriId": "$agriId"}';
  }

  @override
  bool operator ==(covariant AddAgriScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.agriId == agriId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ agriId.hashCode;
  }
}

class AddCropSamplingScreenArguments {
  const AddCropSamplingScreenArguments({
    this.key,
    required this.samplingId,
  });

  final _i21.Key? key;

  final String samplingId;

  @override
  String toString() {
    return '{"key": "$key", "samplingId": "$samplingId"}';
  }

  @override
  bool operator ==(covariant AddCropSamplingScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.samplingId == samplingId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ samplingId.hashCode;
  }
}

class AddTripSheetScreenArguments {
  const AddTripSheetScreenArguments({
    this.key,
    required this.tripId,
  });

  final _i21.Key? key;

  final String tripId;

  @override
  String toString() {
    return '{"key": "$key", "tripId": "$tripId"}';
  }

  @override
  bool operator ==(covariant AddTripSheetScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.tripId == tripId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ tripId.hashCode;
  }
}

extension NavigatorStateExtension on _i23.NavigationService {
  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomePageScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homePageScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginViewScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginViewScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddFarmerScreen({
    _i21.Key? key,
    required String farmerid,
    required _i22.aadharData qrdata,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addFarmerScreen,
        arguments: AddFarmerScreenArguments(
            key: key, farmerid: farmerid, qrdata: qrdata),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListFarmersScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listFarmersScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddCaneScreen({
    _i21.Key? key,
    required String caneId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addCaneScreen,
        arguments: AddCaneScreenArguments(key: key, caneId: caneId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListCaneScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listCaneScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddAgriScreen({
    _i21.Key? key,
    required String agriId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addAgriScreen,
        arguments: AddAgriScreenArguments(key: key, agriId: agriId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListAgriScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listAgriScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddCropSamplingScreen({
    _i21.Key? key,
    required String samplingId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addCropSamplingScreen,
        arguments:
            AddCropSamplingScreenArguments(key: key, samplingId: samplingId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListSamplingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listSamplingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListCompletedSamplingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listCompletedSamplingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddTripSheetScreen({
    _i21.Key? key,
    required String tripId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addTripSheetScreen,
        arguments: AddTripSheetScreenArguments(key: key, tripId: tripId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTripsheetMaster([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tripsheetMaster,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserWiseRegistrationReport([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userWiseRegistrationReport,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCaneRegistrationReport([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.caneRegistrationReport,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVarietyWiseCaneRegistrationReport([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.varietyWiseCaneRegistrationReport,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToYardBalaneScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.yardBalaneScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomePageScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homePageScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginViewScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginViewScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddFarmerScreen({
    _i21.Key? key,
    required String farmerid,
    required _i22.aadharData qrdata,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addFarmerScreen,
        arguments: AddFarmerScreenArguments(
            key: key, farmerid: farmerid, qrdata: qrdata),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListFarmersScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listFarmersScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddCaneScreen({
    _i21.Key? key,
    required String caneId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addCaneScreen,
        arguments: AddCaneScreenArguments(key: key, caneId: caneId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListCaneScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listCaneScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddAgriScreen({
    _i21.Key? key,
    required String agriId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addAgriScreen,
        arguments: AddAgriScreenArguments(key: key, agriId: agriId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListAgriScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listAgriScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddCropSamplingScreen({
    _i21.Key? key,
    required String samplingId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addCropSamplingScreen,
        arguments:
            AddCropSamplingScreenArguments(key: key, samplingId: samplingId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListSamplingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listSamplingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListCompletedSamplingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listCompletedSamplingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddTripSheetScreen({
    _i21.Key? key,
    required String tripId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addTripSheetScreen,
        arguments: AddTripSheetScreenArguments(key: key, tripId: tripId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTripsheetMaster([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tripsheetMaster,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserWiseRegistrationReport([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userWiseRegistrationReport,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCaneRegistrationReport([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.caneRegistrationReport,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVarietyWiseCaneRegistrationReport([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.varietyWiseCaneRegistrationReport,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithYardBalaneScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.yardBalaneScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
