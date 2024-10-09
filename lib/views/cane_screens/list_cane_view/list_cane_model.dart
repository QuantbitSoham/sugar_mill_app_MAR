import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/router.router.dart';
import '../../../constants.dart';
import '../../../models/cane_list_model.dart';
import '../../../services/add_cane_service.dart';
import '../../../services/list_cane_service.dart';

class ListCaneModel extends BaseViewModel {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController seasoncontroller = TextEditingController();
  List<CaneListModel> caneList = [];
  List<CaneListModel> canefilterList = [];
  String caneNameFilter = "";
  String caneseasonFilter = "";
  String canevillageFilter = "";

  Color getTileColor(String? plantationStatus) {
    switch (plantationStatus) {
      case 'New':
        return const Color(0xFFD3E8FD);
      case 'To Sampling':
        return const Color(0xFFEAF5EE);
      case 'Harvester':
        return const Color(0xFFDCEDC8);
      case 'Diversion':
        return const Color(0xFFE1BEE7);
      case 'Added to Sampling':
        return const Color(0xFFCFD8DC);
      case 'Added to Harvesting':
        return const Color(0xFF66BB6A);
      default:
        return const Color(0xFFFFF5F5);
    }
  }

  List<String> seasonlist = [""];

  void initialise(BuildContext context) async {
    setBusy(true);
    // caneList = (await ListCaneService().getAllCaneList()).cast<CaneListModel>();
    seasonlist = await AddCaneService().fetchSeason();
    Logger().i(seasonlist);
    int currentYear = DateTime.now().year;

    // Filter the list to get the latest season
    String latestSeason = seasonlist.firstWhere(
          (season) => season.startsWith("$currentYear-"),
      orElse: () => seasonlist.last, // If no season matches the current year, take the last one
    );
    seasoncontroller.text=latestSeason;
    // canefilterList = caneList;
    await filterListByNameAndVillage(season: latestSeason);
    setBusy(false);
    if (seasonlist.isEmpty) {
      if(context.mounted){
      logout(context);}
    }
    notifyListeners();
  }

Future<void> refresh() async {
  int currentYear = DateTime.now().year;

  // Filter the list to get the latest season
  String latestSeason = seasonlist.firstWhere(
        (season) => season.startsWith("$currentYear-"),
    orElse: () => seasonlist.last, // If no season matches the current year, take the last one
  );
  seasoncontroller.text=latestSeason;
  await filterListByNameAndVillage(season: latestSeason);
  notifyListeners();
}


  Future<void> filterListByNameAndVillage({String? season,String? name, String? village}) async {
    caneseasonFilter=season ?? caneseasonFilter;
    caneNameFilter = name ?? caneNameFilter;
    canevillageFilter = village ?? canevillageFilter;
    notifyListeners();
    canefilterList = await ListCaneService()
        .getCaneListByNameFilter(caneseasonFilter,caneNameFilter, canevillageFilter);

    notifyListeners();
  }



  void onRowClick(BuildContext context, CaneListModel? caneList) {
    Navigator.pushNamed(
      context,
      Routes.addCaneScreen,
      arguments:
          AddCaneScreenArguments(caneId: caneList?.name.toString() ?? " "),
    );
  }
}
