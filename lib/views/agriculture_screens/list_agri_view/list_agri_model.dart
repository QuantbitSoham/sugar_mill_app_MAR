import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../constants.dart';
import '../../../models/agri_list_model.dart';
import '../../../router.router.dart';
import '../../../services/add_cane_service.dart';
import '../../../services/list_agri_services.dart';

class ListAgriModel extends BaseViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController seasonController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  String caneSeasonFilter = "";
  String caneVillageFilter = "";
  String caneNameFilter = "";
  List<AgriListModel> agriList = [];
  List<AgriListModel> filteredAgriList = [];
  List<String> seasonList = [""];
  String latestSeason = "";

  initialise(BuildContext context) async {
    setBusy(true);
    // agriList = (await ListAgriService().getAllCaneList()).cast<AgriListModel>();
    seasonList = await AddCaneService().fetchSeason();
    // filteredagriList = agriList;
    int currentYear = DateTime.now().year;

    // Filter the list to get the latest season
    String latestSeason = seasonList.firstWhere(
          (season) => season.startsWith("$currentYear-"),
      orElse: () => seasonList
          .last, // If no season matches the current year, take the last one
    );
    seasonController.text = latestSeason;
    // canefilterList = caneList;
    await filterListBySeason(name: latestSeason);
    setBusy(false);
    if (seasonList.isEmpty) {
      logout(context);
    }
    notifyListeners();
  }

  ///dhdjhdjhj

  Future<void> refresh() async {
    await filterListBySeason(name: seasonController.text);
    notifyListeners();
  }

  Future<void> filterListBySeason({String? name}) async {
    caneSeasonFilter = name ?? caneSeasonFilter;
    notifyListeners();
    filteredAgriList =
    await ListAgriService().getAgriListByNameFilter(caneSeasonFilter);
    filteredAgriList.sort(
            (a, b) => b.caneRegistrationId!.compareTo(a.caneRegistrationId ?? ''));
    notifyListeners();
  }

  void getAgriListByVillageFarmerNameFilter(
      {String? village, String? name}) async {
    caneNameFilter = name ?? caneNameFilter;
    caneVillageFilter = village ?? caneVillageFilter;
    notifyListeners();
    filteredAgriList = await ListAgriService()
        .getAgriListByvillagefarmernameFilter(
        caneVillageFilter, caneNameFilter);

    notifyListeners();
  }

  void onRowClick(BuildContext context, AgriListModel? agriList) {
    Navigator.pushNamed(
      context,
      Routes.addAgriScreen,
      arguments: AddAgriScreenArguments(agriId: agriList?.name ?? ""),
    );
  }
}
