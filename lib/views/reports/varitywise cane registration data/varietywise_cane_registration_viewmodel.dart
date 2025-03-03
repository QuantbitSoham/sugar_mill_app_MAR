import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/models/varietywiseregistration.dart';
import '../../../services/report_service.dart';

class VarietyWiseCaneRegistrationViewModel extends BaseViewModel {
 List<String> seasonList = [];
  DateTime? selectedFromDate;
  List<VarietyWisePlotReportmodel> reportList = [];
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
    season = "2024-2025";
    // Date format pattern
    final dateFormat = DateFormat('dd-MM-yyyy');

    // Calculate the start and end dates of the season
    final startDayDate = dateFormat.parse("01-06-2023");
    final endDayDate = dateFormat.parse("31-03-2024");
    fromController.text =  DateFormat('yyyy-MM-dd').format(startDayDate);
    toController.text =  DateFormat('yyyy-MM-dd').format(endDayDate);
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
    reportList = await ReportServices().fetchVarietyWiseRegistration(
season ?? "", fromController.text, toController.text);
    notifyListeners();
    setBusy(false);
  }

  Future<void> onToDateChanged(String value) async {
    setBusy(true);
    toDate = value;
    reportList = await ReportServices().fetchVarietyWiseRegistration(
 season ?? "", fromController.text, toController.text);
    notifyListeners();
    setBusy(false);
  }
Future<void> setOperation(String? operaTion) async {
    setBusy(true);
    season = operaTion;
    reportList = await ReportServices().fetchVarietyWiseRegistration(
season ?? "", fromController.text, toController.text);
    notifyListeners();
    setBusy(false);
  }
}

