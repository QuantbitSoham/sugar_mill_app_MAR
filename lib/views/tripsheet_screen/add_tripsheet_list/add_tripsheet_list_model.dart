import 'package:flutter/cupertino.dart';
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
  List<String> seasonlist = [];
  String tripsheetVillageFilter = "";
  String tripsheeNameFilter = "";
  String tripsheetSeasonFilter = "";

  initialise(BuildContext context) async {
    setBusy(true);
    seasonlist = await ListTripshhetService().fetchSeason();
    int currentYear = DateTime.now().year;

    // Filter the list to get the latest season
    String latestSeason = seasonlist.firstWhere(
          (season) => season.startsWith("$currentYear-"),
      orElse: () => seasonlist.last, // If no season matches the current year, take the last one
    );
    seasonController.text=latestSeason;
 await filterListByNameAndVillage(season: latestSeason);
    setBusy(false);
    if (seasonlist.isEmpty) {
      logout(context);
    }
    notifyListeners();
  }

Future<void> refresh() async {
   tripSheetFilter= (await ListTripshhetService().getAllTripsheetList())
        .cast<TripSheetSearch>();
  tripSheetFilter.sort((a, b) => b.name!.compareTo(a.name ?? 0)); 
  notifyListeners();
}

  void filterList(String filter, int query) async {
    notifyListeners();
    tripSheetFilter =
        await ListTripshhetService().getAllTripsheetListfilter(filter, query);
    notifyListeners();
  }

  Future<void> filterListByNameAndVillage(
      {String? transName, String? village, String? season}) async {
    tripsheeNameFilter = transName ?? tripsheeNameFilter;
    tripsheetVillageFilter = village ?? tripsheetVillageFilter;
    tripsheetSeasonFilter = season ?? tripsheetSeasonFilter;
    notifyListeners();
    tripSheetFilter = await ListTripshhetService().getTransporterNameFilter(
        tripsheeNameFilter, tripsheetVillageFilter, tripsheetSeasonFilter);
    tripSheetFilter.sort((a, b) => b.name!.compareTo(a.name ?? 0)); 
    notifyListeners();
  }

  void onRowClick(BuildContext context, TripSheetSearch? tripList) {
    Navigator.pushNamed(
      context,
      Routes.addTripsheetScreen,
      arguments:
          AddTripsheetScreenArguments(tripId: tripList?.name.toString() ?? " "),
    );
  }
}
