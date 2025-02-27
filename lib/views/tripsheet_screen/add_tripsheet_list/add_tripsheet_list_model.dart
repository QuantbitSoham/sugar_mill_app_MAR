import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../constants.dart';
import '../../../models/tripsheet_list_search.dart';
import '../../../router.router.dart';
import '../../../services/list_tripsheet_service.dart';

class ListTripsheet extends BaseViewModel {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController seasonController = TextEditingController();
  List<TripSheetSearch> triSheetList = [];
  List<TripSheetSearch> tripSheetFilter = [];
  List<String> seasonList = [];
  String tripSheetVillageFilter = "";
  String tripSheeNameFilter = "";
  String tripsheetSeasonFilter = "";

  initialise(BuildContext context) async {
    setBusy(true);
    seasonList = await ListTripshhetService().fetchSeason();
    int currentYear = DateTime.now().year;

    // Filter the list to get the latest season
    String latestSeason = seasonList.firstWhere(
      (season) => season.startsWith("$currentYear-"),
      orElse: () => seasonList
          .last, // If no season matches the current year, take the last one
    );
    seasonController.text = "2024-2025";
    await filterListByNameAndVillage(season: "2024-2025");
    setBusy(false);
    if (seasonList.isEmpty) {
      logout(context);
    }
    notifyListeners();
  }

  Color getTileColor(String? plantationStatus) {
    switch (plantationStatus) {
      case 'New':
        return  Colors.grey;
      case 'Token Pending':
        return Colors.redAccent.shade200;
      case 'Token Submitted':
        return Colors.blue;
      case 'Weight Done':
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  Future<void> refresh() async {
    int currentYear = DateTime.now().year;

    // Filter the list to get the latest season
    String latestSeason = seasonList.firstWhere(
          (season) => season.startsWith("$currentYear-"),
      orElse: () => seasonList
          .last, // If no season matches the current year, take the last one
    );
    seasonController.text = latestSeason;
    await filterListByNameAndVillage(season: latestSeason);
  }

  void filterList(String filter, String query) async {
    notifyListeners();
    tripSheetFilter =
        await ListTripshhetService().getAllTripsheetListfilter(filter, query);
    notifyListeners();
  }

  Future<void> filterListByNameAndVillage(
      {String? transName, String? village, String? season}) async {
    tripSheeNameFilter = transName ?? tripSheeNameFilter;
    tripSheetVillageFilter = village ?? tripSheetVillageFilter;
    tripsheetSeasonFilter = season ?? tripsheetSeasonFilter;
    notifyListeners();
    tripSheetFilter = await ListTripshhetService().getTransporterNameFilter(
        tripSheeNameFilter, tripSheetVillageFilter, tripsheetSeasonFilter);
    notifyListeners();
  }

  void onRowClick(BuildContext context, TripSheetSearch? tripList) {
    Navigator.pushNamed(
      context,
      Routes.addTripSheetScreen,
      arguments:
          AddTripSheetScreenArguments(tripId: tripList?.name.toString() ?? " "),
    );
  }
}
