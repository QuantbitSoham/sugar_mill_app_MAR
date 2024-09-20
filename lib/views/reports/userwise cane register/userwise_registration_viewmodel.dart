import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/services/report_service.dart';

import '../../../models/userwise_registration_model.dart';

class UserRegistrationReportViewModel extends BaseViewModel {
  List<String> seasonList = [];
  DateTime? selectedFromDate;
  List<UserWiseRegistrationModel> reportList = [];
  DateTime? selectedToDate;
  String? fromDate;
  String? toDate;
  String? season;
  String? village;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  initialise(BuildContext context) async {
    setBusy(true);
    seasonList = await ReportServices().fetchSeason();
    int currentYear = DateTime.now().year;
    // Filter the list to get the latest season
    String latestSeason = seasonList.firstWhere(
      (season) => season.startsWith("$currentYear-"),
      orElse: () => seasonList
          .last, // If no season matches the current year, take the last one
    );
    final seasonRegex = RegExp(r'^(\d{4})-(\d{4})$');
    final match = seasonRegex.firstMatch(latestSeason);
    if (match == null) {
      return "Invalid season format. Please enter season in YYYY-YYYY format.";
    }
    season = latestSeason;
    final startYear = int.parse(match.group(1)!) - 1;
    final endYear = int.parse(match.group(1)!);

    // Date format pattern
    final dateFormat = DateFormat('dd-MM-yyyy');

    // Calculate the start and end dates of the season
    final startDayDate = dateFormat.parse("01-06-$startYear");
    final endDayDate = dateFormat.parse("31-03-$endYear");

    fromController.text = startDayDate.toString();
    toController.text = endDayDate.toString();
    await onToDateChanged(toController.text);
    setBusy(false);
  }

  //
  Future<void> selectValidFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedFromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedFromDate) {
      selectedFromDate = picked;
      fromController.text = DateFormat('yyyy-MM-dd').format(picked);
      fromDate = fromController.text;
    }
  }

  Future<void> selectValidTolDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedToDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedToDate) {
      selectedToDate = picked;
      toController.text = DateFormat('yyyy-MM-dd').format(picked);
      toDate = toController.text;
    }
  }

  Future<void> onFromDateDobChanged(String value) async {
    setBusy(true);
    fromDate = value;
    reportList = await ReportServices().fetchUserWiseRegistration(
        village ?? "", season ?? "", fromController.text, toController.text);
    notifyListeners();
    setBusy(false);
  }

  Future<void> onToDateChanged(String value) async {
    setBusy(true);
    toDate = value;
    reportList = await ReportServices().fetchUserWiseRegistration(
        village ?? "", season ?? "", fromController.text, toController.text);
    notifyListeners();
    setBusy(false);
  }

  Future<void> setOperation(String? operaTion) async {
    setBusy(true);
    season = operaTion;
    reportList = await ReportServices().fetchUserWiseRegistration(
        village ?? "", season ?? "", fromController.text, toController.text);
    notifyListeners();
    setBusy(false);
  }

  Future<void> setWorkOrder(String? workorder) async {
    setBusy(true);

    village = workorder;
    reportList = await ReportServices().fetchUserWiseRegistration(
        village ?? "", season ?? "", fromController.text, toController.text);
    notifyListeners();
    setBusy(false);
  }
}
