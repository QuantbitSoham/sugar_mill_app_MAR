import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/models/varietywiseregistration.dart';
import '../../../services/report_service.dart';

class VarietyWiseCaneRegistrationViewModel extends BaseViewModel {
  List<ColumnDefinition> columnNames = [];
  List<CircleRecord> rowData = [];

  Future<void> fetchData(String season, String startDate, String endDate) async {
    setBusy(true);
    try {
      var response = await ReportServices().fetchVarietyWiseRegistration(season, startDate, endDate);
      if (response != null) {
        columnNames = response.columns;
        rowData = response.data;
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }
    setBusy(false);
    notifyListeners();
  }
}

