import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import '../../../constants.dart';
import '../../../models/list_crop_sampling_model.dart';
import '../../../router.router.dart';
import '../../../services/add_cane_service.dart';
import '../../../services/list_crop_sampling_service.dart';

class ListSamplingModel extends BaseViewModel {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController seasoncontroller = TextEditingController();
  TextEditingController villagecontroller = TextEditingController();
  List<ListSampling> samplingList = [];
  List<ListSampling> filtersamplingList = [];
  String caneSeasonFilter = "";
  String caneVillageFilter = "";
  String caneNameFilter = "";
  List<String> seasonlist = [""];
  TextEditingController idcontroller = TextEditingController();
  Color getTileColor(String? plantationStatus) {
    switch (plantationStatus) {
      case 'New':
        return const Color(0xFFD3E8FD);
      case 'To Sampling':
        return const Color(0xFFEAF5EE);
      case 'To Harvesting':
        return const Color(0xFFFFF5F5);
      default:
        return const Color(0xFF404944);
    }
  }

  initialise(BuildContext context) async {
    setBusy(true);
    // samplingList = (await ListCropSamplingServices().getAllCropSamplingList());
    seasonlist = await AddCaneService().fetchSeason();

    int currentYear = DateTime.now().year;

    // Filter the list to get the latest season
    String latestSeason = seasonlist.firstWhere(
          (season) => season.startsWith("$currentYear-"),
      orElse: () => seasonlist.last, // If no season matches the current year, take the last one
    );
    seasoncontroller.text=latestSeason;
    // filtersamplingList = samplingList;
    await filterListBySeason(name: latestSeason);
    setBusy(false);
    if (seasonlist.isEmpty) {
      logout(context);
    }
    notifyListeners();
  }

Future<void> refresh() async {
   filtersamplingList= (await ListCropSamplingServices().getAllCropSamplingList());
  notifyListeners();
}

  void onRowClick(BuildContext context, ListSampling? samplingList) {
    Navigator.pushNamed(
      context,
      Routes.addCropSamplingScreen,
      arguments: AddCropSamplingScreenArguments(
          samplingId: samplingList?.name ?? ""),
    );
    // Navigator.pushNamed(context, Routes.detailedFarmerScreen,
    //     arguments: DetailedFarmerScreenArguments(id: farmresList?.name ?? ""));
  }


  Future<void> filterListBySeason({String? name}) async {
    caneSeasonFilter = name ?? caneSeasonFilter;
    notifyListeners();
    filtersamplingList =
    await ListCropSamplingServices().filterListBySeason(caneSeasonFilter);
    notifyListeners();
  }

  void getListByvillagefarmernameFilter({String? village, String? name}) async {
    caneNameFilter = name ?? caneNameFilter;
    caneVillageFilter = village ?? caneVillageFilter;
    notifyListeners();
    filtersamplingList = await ListCropSamplingServices()
        .getListByvillagefarmernameFilter(caneVillageFilter, caneNameFilter);
    notifyListeners();
  }
}
