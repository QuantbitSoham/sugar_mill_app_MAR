import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/services/report_service.dart';

import '../../../models/cane_master_report_model.dart';

class CaneRegistrationViewModel extends BaseViewModel {
  List<CaneMasterReportModel> reportList = [];
  List<CaneMasterReportModel> filteredReportList = [];

  initialise(BuildContext context) async {
    setBusy(true);
    reportList = await ReportServices().fetchCaneRegistrationReport();
    filteredReportList = List.from(reportList); // Initial state is unfiltered list
    notifyListeners();
    setBusy(false);
  }

  void applyFiltersAndSorting({
    String? plotNo,
    String? vendorCode,
    String? vendorName,
    String? village,
  }) {
    List<CaneMasterReportModel> filteredList = reportList;

    // Apply filters based on user input
    if (plotNo != null && plotNo.isNotEmpty) {
      filteredList = filteredList
          .where((item) => item.plotNo.toString().contains(plotNo))
          .toList();
    }
    if (vendorCode != null && vendorCode.isNotEmpty) {
      filteredList = filteredList
          .where((item) => item.vendorCode.toString().contains(vendorCode))
          .toList();
    }
    if (vendorName != null && vendorName.isNotEmpty) {
      filteredList = filteredList
          .where((item) => item.growerName.toString().toLowerCase().contains(vendorName.toLowerCase()))
          .toList();
    }
    if (village != null && village.isNotEmpty) {
      filteredList = filteredList
          .where((item) => item.village.toString().toLowerCase().contains(village.toLowerCase()))
          .toList();
    }

    // You can also apply sorting logic here if needed

    // Update the filtered report list
    reportList = filteredList;
    notifyListeners(); // Ensure UI updates with filtered results
  }

}
