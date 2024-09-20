import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/models/cane_farmer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sugar_mill_app/router.router.dart';
import 'package:sugar_mill_app/services/add_cane_service.dart';
import 'package:sugar_mill_app/services/geolocation_service.dart';
import '../../../constants.dart';
import '../../../models/cane.dart';
import '../../../models/cane_masters.dart';
import '../../../services/add_farmer_service.dart';
import '../../../widgets/cdate_custom.dart';

class CaneViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController plantationdateController = TextEditingController();
  TextEditingController formNumberController = TextEditingController();
  TextEditingController surveyNumberController = TextEditingController();
  TextEditingController areainAcrsController = TextEditingController();
  TextEditingController baselDateController = TextEditingController();
  Cane canedata = Cane();
  CaneMasters masters = CaneMasters();
  List<String> plantlist = [""];
  bool isCheck = false;
  bool role = false;
  List<String> seasonlist = [""];
  final List<String> yesno = ["Yes", "No"];
  final List<String> yesnomachine = ["YES", "NO"];
  final List<String> yesnoroadside = ["Yes (होय)", "No (नाही)"];
  final List<String> plantationStatus = [
    "New",
    "Harvester",
    "Diversion",
    "Added To Sampling",
    "Added To Harvesting",
    "To Sampling",
    "To Harvesting"
  ];
  final List<String> seedType = ["Regular", "Foundation"];
  List<caneFarmer> farmerList = [];
  List<Village> villageList = [];
  List<String> canevarietyList = [""];
  List<String> plantationsystemList = [""];
  List<String> seedmaterialList = [""];
  List<String> croptypeList = [""];
  List<CaneRoute> routeList = [];
  List<String> irrigationmethodList = [""];
  List<String> irrigationSourceList = [""];
  List<String> soilTypeList = [""];
  List<String> cropVarietyList = [""];
  late String caneId;
  String? name;
  String? selectedVillage;
  String? selectedirrigationmethod;
  String? selectedirrigationsource;
  String? selectedcroptype;
  String? selectedcropVariety;
  String? selectedSoilType;
  String? selectedSeedMaterial;
  String? selectedRoute;
  String? selectedPlantationSystem;
  double? selectedDistance;
  String? selectedvillage;
  DateTime? selectedDate;
  DateTime? selectedBaselDate;
  String? selectedCaneRoute = "";
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  initialise(BuildContext context, String caneId) async {
    setBusy(true);
    masters = await AddCaneService().getMasters() ?? CaneMasters();
    villageList = masters.village ?? [];
    plantlist = masters.plant ?? [];
    seasonlist = masters.season ?? [];
    canevarietyList = masters.caneVariety ?? [];
    plantationsystemList = masters.plantationSystem ?? [];
    seedmaterialList = masters.seedMaterialUsed ?? [];
    routeList = masters.caneRoute ?? [];
    croptypeList = masters.cropType ?? [];
    irrigationmethodList = masters.irrigationMethod ?? [];
    irrigationSourceList = masters.irrigationSource ?? [];
    soilTypeList = masters.soilType ?? [];
    Logger().i(masters.toJson());
    canedata.plantName = "Bedkihal";
    canedata.plantationStatus = "New";

    role = await FarmerService().role();
    int currentYear = DateTime.now().year;

    // Filter the list to get the latest season
    String latestSeason = seasonlist.firstWhere(
      (season) => season.startsWith("$currentYear-"),
      orElse: () => seasonlist
          .last, // If no season matches the current year, take the last one
    );
    canedata.season = latestSeason;
    Logger().i(caneId);
    if (caneId != "") {
      isEdit = true;
      canedata = await AddCaneService().getCane(caneId) ?? Cane();
      selectedCaneRoute = canedata.route;

      for (CaneRoute i in routeList) {
        if (i.name == canedata.route) {
          selectedCaneRoute = i.route;
        }
      }
      notifyListeners();
      areainAcrsController.text = canedata.areaAcrs.toString();
      surveyNumberController.text = canedata.surveyNumber ?? "";
      formNumberController.text = canedata.formNumber ?? "";
      plantationdateController.text = canedata.plantattionRatooningDate != ""
          ? dateFormat
              .format(DateTime.parse(canedata.plantattionRatooningDate ?? ""))
          : "";
      String? formattedDate = canedata.basalDate != null
          ? dateFormat.format(DateTime.parse(canedata.basalDate ?? ""))
          : canedata.basalDate ?? "";
      baselDateController.text = formattedDate;
    }
    if (villageList.isEmpty) {
      if(context.mounted){
        logout(context);
      }

    }
    setBusy(false);
  }


  bool isVisible(String? plantationStatus) {
    print(
        'name: ${canedata.name}, role: $role, isEdit: $isEdit, plantationStatus: $plantationStatus');

    bool visibility = true; // Default value

    if (role == true && isEdit == true && plantationStatus != "Diversion") {
      print('Condition 1 triggered: role and isEdit are true, but plantationStatus is not "Diversion"');
      visibility = false;
    } else if (plantationStatus == "Diversion" && isEdit == true) {
      print('Condition 2 triggered: plantationStatus is "Diversion" and isEdit is true');
      visibility = true;
    }

// Notify after checking the conditions
    return visibility;
  }



  void showSuccessDialog(BuildContext context, String? name) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$name plot registered successfully"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, Routes.listCaneScreen); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void onSavePressed(BuildContext context) async {
    setBusy(true);

    if (formKey.currentState!.validate()) {
      bool res = false;

      // Check if we need to update location (only if isEdit is false)
      if (!isEdit) {
        // Create an instance of your GeolocationService
        GeolocationService geolocationService = GeolocationService();

        // Check for location permissions
        PermissionStatus permission = await Permission.location.status;
        if (permission != PermissionStatus.granted) {
          // Request location permission
          permission = await Permission.location.request();
          if (permission != PermissionStatus.granted) {
            Fluttertoast.showToast(msg: 'Location permission denied');
            setBusy(false);
            return;
          }
        }

        // Get the user's position using the geolocation service
        Position? position = await geolocationService.determinePosition();

        if (position != null) {
          // Get the placemark using the geolocation service
          Placemark? placemark =
              await geolocationService.getPlacemarks(position);

          if (placemark != null) {
            // Extract properties from the placemark
            String street = placemark.street ?? '';
            String subLocality = placemark.subLocality ?? '';
            String locality = placemark.locality ?? '';
            String postalCode = placemark.postalCode ?? '';
            String country = placemark.country ?? '';
            // Create a formatted address string
            String formattedAddress =
                '$street, $subLocality, $locality $postalCode, $country';
            // Update canedata object with latitude, longitude, and address
            canedata.latitude = position.latitude.toString();
            canedata.longitude = position.longitude.toString();
            canedata.city = formattedAddress;
          } else {
            // Handle case where placemark is null
            Fluttertoast.showToast(msg: 'Failed to get placemark');
            setBusy(false);
            return;
          }
        } else {
          // Handle case where obtaining location fails
          Fluttertoast.showToast(msg: 'Failed to get location');
          setBusy(false);
          return;
        }
      }

      // Proceed with saving the data
      Logger().i(canedata.toJson().toString());

      if (isEdit == true) {
        res = await AddCaneService().updateCane(canedata);
        if (res) {
          if (context.mounted) {
            Navigator.pop(context);
          }
        }
      } else {
        String? name = await AddCaneService().addCane(canedata);
        if (name.isNotEmpty) {
          if(context.mounted){
            Navigator.pop(context);
            showSuccessDialog(context, name);
          }

        }
      }
    }

    setBusy(false);
  }

  String errorMessage = '';

  void onPlantationDateChanged(String value) {
    String formattedDate = DateInputHelper.formatInput(value);
    bool isValidDate = DateInputHelper.isValidDate(formattedDate);
    plantationdateController.value = plantationdateController.value.copyWith(
      text: formattedDate,
      selection: TextSelection.collapsed(offset: formattedDate.length),
    );
    if (isValidDate) {
      errorMessage = '';
      // Parse the formatted date using "dd-MM-yyyy" format
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(formattedDate);

// Format the parsed date into "yyyy-MM-dd" format
      String formattedDateInDesiredFormat =
          DateFormat('yyyy-MM-dd').format(parsedDate);

      Logger().i(formattedDateInDesiredFormat);
      selectedDate = DateTime.parse(formattedDateInDesiredFormat);
      canedata.plantattionRatooningDate =
          DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now());
      // Format selectedDate as "YYYY-MM-DD" string
    } else {
      errorMessage = 'Invalid date';
    }
  }

  String errorMessageforbasel = '';

  void onBaselDateChanged(String value) {
    String formattedDate = DateInputHelper.formatInput(value);
    bool isValidDate = DateInputHelper.isValidDate(formattedDate);
    baselDateController.value = baselDateController.value.copyWith(
      text: formattedDate,
      selection: TextSelection.collapsed(offset: formattedDate.length),
    );
    if (isValidDate) {
      errorMessageforbasel = '';
      // Parse the formatted date using "dd-MM-yyyy" format
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(formattedDate);

// Format the parsed date into "yyyy-MM-dd" format
      String formattedDateInDesiredFormat =
          DateFormat('yyyy-MM-dd').format(parsedDate);
      Logger().i(formattedDateInDesiredFormat);
      selectedDate = DateTime.parse(formattedDateInDesiredFormat);
      canedata.basalDate =
          DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now());
      // Format selectedDate as "YYYY-MM-DD" string
    } else {
      errorMessageforbasel = 'Invalid date';
    }
  }

  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (picked != null && picked != selectedDate) {
  //     selectedDate = picked;
  //     plantationdateController.text = DateFormat('yyyy-MM-dd').format(picked);
  //     canedata.plantattionRatooningDate = plantationdateController.text;
  //   }
  // }
  //
  // Future<void> selectBaselDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedBaselDate ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (picked != null && picked != selectedBaselDate) {
  //     selectedBaselDate = picked;
  //     baselDateController.text = DateFormat('yyyy-MM-dd').format(picked);
  //     canedata.basalDate = baselDateController.text;
  //   }
  // }

  void setSelectedSeedType(String? seedType) {
    canedata.seedType = seedType;
    notifyListeners();
  }

  void setSelectedAreaInAcrs(String? areainAcrs) {
    areainAcrsController.value = areainAcrsController.value.copyWith(
      text: areainAcrs ?? '',
      selection: TextSelection.collapsed(offset: (areainAcrs ?? '').length),
    );
    canedata.areaAcrs = double.tryParse(areainAcrs ?? "") ?? 0;
    notifyListeners();
  }

  void setSelectedCropVariety(String? cropVariety) {
    selectedcropVariety = cropVariety;
    canedata.cropVariety = selectedcropVariety;
    notifyListeners();
  }

  void setSelectedVillage(BuildContext context, String? village) async {
    selectedVillage = village;
    canedata.village = selectedVillage;
    Logger().i(village);
    farmerList =
        await AddCaneService().fetchfarmerListwithfilter(village ?? "");
    if (farmerList.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,

            content: Text(
              'There is no Approved farmer Available At $village village',
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            duration: const Duration(
                seconds: 3), // Adjust the duration as needed
          ),
        );
      }
    }
    notifyListeners();
  }

  void setSelectedRoute(CaneRoute route) {
    Logger().i("ROUTE IS: $route");
    selectedRoute = route.route;
    selectedCaneRoute = route.route;
    canedata.route = route.name;
    notifyListeners();
    selectedDistance = route.distanceKm; // Set th distance in the kmController
    canedata.routeKm = selectedDistance;
    selectedvillage = route.circleOffice;
    Logger().i(selectedvillage);
    canedata.circleOffice = selectedvillage;
    Logger().i(selectedDistance);
    notifyListeners();
  }

  void setRouteKm(double? routekm) {
    selectedDistance = routekm;
    canedata.routeKm = selectedDistance;
    notifyListeners();
  }

  void setSelectedSeedMaterial(String? seedMaterial) {
    selectedSeedMaterial = seedMaterial;
    canedata.seedMaterial = selectedSeedMaterial;
    notifyListeners();
  }

  void setSelectedPlantationSystem(String? plantationSystem) {
    selectedPlantationSystem = plantationSystem;
    canedata.plantationSystem = selectedPlantationSystem;
    notifyListeners();
  }

  void setSelectedCircleOffice(String? office) {
    selectedvillage = office;
    canedata.circleOffice = selectedvillage;
    notifyListeners();
  }

  void setSelectedPlant(String? plant) {
    canedata.plantName = plant;
    notifyListeners();
  }

  void setcheck(bool? plant) {
    isCheck = plant ?? false;
    canedata.lateRegistration = isCheck ? 1 : 0;
    Logger().i(canedata.lateRegistration);
    notifyListeners();
  }

  void setSelectedSeason(String? season) {
    canedata.season = season;
    notifyListeners();
  }

  void setSelectedDevelopmentPlot(String? developmentPlot) {
    canedata.developmentPlot = developmentPlot;
    notifyListeners();
  }

  void setSelectedIsMachine(String? isMachine) {
    canedata.isMachine = isMachine;
    notifyListeners();
  }

  void setSelectedIrrigationMethod(String? irrigationmethod) {
    selectedirrigationmethod = irrigationmethod;
    canedata.irrigationMethod = selectedirrigationmethod;
    notifyListeners();
  }

  void setSelectedIrrigationSource(String? irrigationsource) {
    selectedirrigationsource = irrigationsource;
    canedata.irrigationSource = selectedirrigationsource;
    notifyListeners();
  }

  void setSelectedCropType(String? croptype) {
    selectedcroptype = croptype;
    canedata.cropType = selectedcroptype;
    notifyListeners();
  }

  void setSelectedSoilType(String? soilType) {
    selectedSoilType = soilType;
    canedata.soilType = selectedSoilType;
    notifyListeners();
  }

  String? selectedgrowercode;
  String? selectedgrowername;

  void setSelectedGrowerCode(String? growercode) {
    selectedgrowercode = growercode;
    final selectedgrowerData = farmerList.firstWhere(
        (growerData) => growerData.existingSupplierCode == growercode);
    Logger().i(selectedgrowerData);
    selectedgrowername =
        selectedgrowerData.supplierName; // Set th distance in the kmController
    canedata.growerCode = selectedgrowerData.name;
    canedata.growerName = selectedgrowername;
    Logger().i(selectedgrowername);
    notifyListeners();
  }

  void setSelectedGrowerName(String? growername) {
    selectedgrowername = growername;
    canedata.growerName = selectedgrowername;
    notifyListeners();
  }

  void setSelectedKisan(String? kisan) {
    canedata.isKisanCard = kisan;
    notifyListeners();
  }

  void setSelectedPlantation(String? plantationStatus) {
    canedata.plantationStatus = plantationStatus;
    isVisible(plantationStatus);
    notifyListeners();
  }

  void setSelectedRoadSIde(String? roadside) {
    canedata.roadSide = roadside;
    notifyListeners();
  }

  void setSurveyNumber(String? surveyNumber) {
    surveyNumberController.value = surveyNumberController.value.copyWith(
      text: surveyNumber ?? '',
      selection: TextSelection.collapsed(offset: (surveyNumber ?? '').length),
    );
    canedata.surveyNumber = surveyNumber ?? '';
    notifyListeners();
  }

  void setFormNumber(String? formNumber) {
    formNumberController.value = formNumberController.value.copyWith(
      text: formNumber ?? '',
      selection: TextSelection.collapsed(offset: (formNumber ?? '').length),
    );
    canedata.formNumber = formNumber ?? '';
    notifyListeners();
  }

  bool isEdit = false;

  getVisibility() {
    return isEdit;
  }

  ////////////////// validators ////////////////////////////////////

  String? validateAreaInAcrs(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Area in Acrs';
    }
    if (double.parse(value) == 0) {
      return 'Area should be greater than 0.';
    }
    return null;
  }

  String? validatePlantationDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select plantation date';
    }

    final dateFormat = DateFormat('dd-MM-yyyy');
    DateTime parsedDate;

    try {
      parsedDate = dateFormat.parseStrict(value);
    } catch (e) {
      return 'Invalid date format. Please enter date in dd-MM-yyyy format';
    }

    // Use checkDate to validate the date range
    final validationError =
        DateValidator(season: canedata.season, plantationRatooningDate: value)
            .checkDate(parsedDate);
    if (validationError != null) {
      return validationError;
    }
    return null;
  }

  String? validateRoute(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Route';
    }
    return null;
  }

  String? validateVillage(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Village';
    }
    return null;
  }

  String? validatePlantationSystem(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Plantation System';
    }
    return null;
  }

  String? validatePlant(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Plant';
    }
    return null;
  }

  String? validateCropVariety(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Crop Variety';
    }
    return null;
  }

  String? validateSeedMaterial(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Seed Material';
    }
    return null;
  }

  String? validateirrigationMethod(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Irrigation Method';
    }
    return null;
  }

  String? validateirrigationSource(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Irrigation Source';
    }
    return null;
  }

  String? validateSeason(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Season';
    }
    return null;
  }

  String? validateSoilType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Soil Type';
    }
    return null;
  }

  String? validateGrowerCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Grower Code';
    }
    return null;
  }

  String? validateKisanCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Is Kisan Card';
    }
    return null;
  }

  String? validatePlantationStatus(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select plantation status';
    }
    return null;
  }

  String? validateRoadSide(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Road Side';
    }
    return null;
  }

  String? validateCropType(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Crop Type';
    }
    return null;
  }
}

class DateValidator {
  String? season;
  String? plantationRatooningDate;

  DateValidator({required this.season, required this.plantationRatooningDate});

  String? checkDate(DateTime plantationDate) {
    final seasonRegex = RegExp(r'^(\d{4})-(\d{4})$');
    final match = seasonRegex.firstMatch(season!);
    if (match == null) {
      return "Invalid season format. Please enter season in YYYY-YYYY format.";
    }

    // Extract the start and end year from the season
    final startYear = int.parse(match.group(1)!) - 1;
    final endYear = int.parse(match.group(1)!);

    // Date format pattern
    final dateFormat = DateFormat('dd-MM-yyyy');

    // Calculate the start and end dates of the season
    final startDayDate = dateFormat.parse("01-06-$startYear");
    final endDayDate = dateFormat.parse("31-03-$endYear");

    // Check if the plantation date falls within the specified range
    if (plantationDate.isBefore(startDayDate) ||
        plantationDate.isAfter(endDayDate)) {
      return "Date must be between \n${dateFormat.format(startDayDate)} and ${dateFormat.format(endDayDate)}";
    }
    return null;
  }

  String? validatePlantationDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select plantation date';
    }

    final dateFormat = DateFormat('dd-MM-yyyy');
    DateTime parsedDate;

    try {
      parsedDate = dateFormat.parseStrict(value);
    } catch (e) {
      return 'Invalid date format. Please enter date in dd-MM-yyyy format';
    }

    // Use checkDate to validate the date range
    final validationError = checkDate(parsedDate);
    if (validationError != null) {
      return validationError;
    }

    return null;
  }
}
