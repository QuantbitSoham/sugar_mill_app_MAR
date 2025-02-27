import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/constants.dart';
import 'package:sugar_mill_app/models/farmer.dart';
import 'package:sugar_mill_app/services/add_farmer_service.dart';
import '../../../models/aadharData_model.dart';
import '../../../models/bank_model.dart';
import '../../../models/village_model.dart';
import '../../../router.router.dart';
import '../../../widgets/cdate_custom.dart';

class FarmerViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final bankformKey = GlobalKey<FormState>();
  TextEditingController plantController = TextEditingController();
  TextEditingController supplierNameController = TextEditingController();
  TextEditingController aadharNumberController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  List<BankDetails> bankAccounts = [];
  final List<String> items = ['Tran', 'Har', 'Far', 'Mem', 'Drip', 'Nursery'];
  final List<String> plantlist = ['Bedkihal', 'Nagpur'];
  final List<String> vendorGroupList = ['Cane'];
  final List<String> roles = ['Farmer', 'Harvester', 'Transporter'];
  List<villagemodel> villageList = [];
  List<BankMaster> bankList = [];
  List<String> bankPassbookUrls = [];
  DateTime? selectedDate;
  Farmer farmerData = Farmer();
  late String accountNumber;
  late String branchifscCode = "";
  late String bankName;

  late String farmerId;
  late String bankandbranch;
  late String passbookattch = "";
  bool isPassbookAdded = false;
  bool role = false;

  bool isEdit = false;

  final List<String> _selectedItems = [];

  List<String> get selectedItems => _selectedItems;

  initialise(BuildContext context, String farmerid, aadharData qrdata) async {
    setBusy(true);
    villageList = await FarmerService().fetchVillages();
    bankList = await FarmerService().fetchBanks();
    role = await FarmerService().role();

    Logger().i(role);
    _selectedItems.add(items[2]);
    farmerData.isFarmer = 1;
    farmerData.branch = "Bedkihal";
    Logger().i(villageList.length);
    farmerId = farmerid;
    //setting aleardy available data
    if (qrdata.name != null) {
      farmerData.supplierName = qrdata.name;
      farmerData.dateOfBirth = qrdata.dob;
      farmerData.aadhaarNumber = "********${qrdata.aadhaarLast4Digit}";
      _formatAadhar(farmerData.aadhaarNumber.toString());
      supplierNameController.text = farmerData.supplierName ?? "";
      aadharNumberController.text =
          _formatAadhar(farmerData.aadhaarNumber ?? "");
      dobController.text = farmerData.dateOfBirth.toString();
      onDobChanged(dobController.text);
      farmerData.taluka = qrdata.subdistrict;
      farmerData.village = qrdata.postoffice;
      String gender = "";
      if (qrdata.gender == "M") {
        gender = 'Male';
      } else if (qrdata.gender == "F") {
        gender = 'Female';
      } else {
        gender = 'Other';
      }
      farmerData.gender = gender;
    }
    if (farmerId != "") {
      isEdit = true;
      farmerData = await FarmerService().getFarmer(farmerid) ?? Farmer();
      notifyListeners();
      plantController.text = farmerData.branch ?? "";
      supplierNameController.text = farmerData.supplierName ?? "";
      aadharNumberController.text =
          _formatAadhar(farmerData.aadhaarNumber ?? "");
      mobileNumberController.text = farmerData.mobileNumber ?? "";
      panNumberController.text = farmerData.panNumber ?? "";
      String? formattedDate = farmerData.dateOfBirth != null
          ? DateFormat('dd-MM-yyyy')
              .format(DateTime.parse(farmerData.dateOfBirth ?? ""))
          : farmerData.dateOfBirth ?? "";
      dobController.text = formattedDate;
      isVisible();
      ageController.text = farmerData.age ?? "";
      bankAccounts.addAll(farmerData.bankDetails?.toList() ?? []);
      for (BankDetails bank in bankAccounts) {
        bankPassbookUrls.add(bank.bankPassbook ?? "");
      }

      if (farmerData.isTransporter == 1) {
        _selectedItems.add(items[0]);
      }
      if (farmerData.isHarvester == 1) {
        _selectedItems.add(items[1]);
      }
      if (farmerData.isFarmer == 1) {
        _selectedItems.add(items[2]);
      }
      if (farmerData.isMember == 1) {
        _selectedItems.add(items[3]);
      }
      if (farmerData.drip == 1) {
        _selectedItems.add(items[4]);
      }
      if (farmerData.nursery == 1) {
        _selectedItems.add(items[5]);
      }
    }

    if (villageList.isEmpty) {
      logout(context);
    }
    farmerData.supplierGroup = "CANE";
    setBusy(false);
  }

  bool isVisible() {
    if (farmerData.workflowState == 'Approved' &&
        role == true &&
        isEdit == true) {
      return true;
    }
    return false;
  }

  Color getColorForStatus(String status) {
    switch (status) {
      case 'New':
        return Colors.blueAccent; // Light Blue Grey for Lead
      // Light Green for Interested
      case 'Approved':
        return Colors.green;
      case 'Rejected':
        return Colors.redAccent.shade700; // Dark Grey for Converted
      case 'Pending For Agriculture Officer':
        return Colors.red.shade700;
      case 'Pending':
        return Colors.red.shade700;
      default:
        return Colors.grey; // Default Grey for unknown status
    }
  }

  void onSavePressed(BuildContext context) async {
    // if (farmerData.workflowState == "Approved") {
    //   Fluttertoast.showToast(msg: "Can not edit approved document!");
    //   return;
    // }

    if (isEdit == true) {
      if (farmerData.aadhaarCard == null && files.adharCard == null) {
        Fluttertoast.showToast(msg: "Please upload aadhaar card");
        return;
      }
    } else {
      if (files.adharCard == null) {
        Fluttertoast.showToast(msg: "Please upload aadhaar card");
        return;
      }
    }
    Logger().i(farmerData.isHarvester);
    // if(farmerData.isHarvester == 1){ if(isEdit==true){if(farmerData.panCard == null && files.panCard == null){
    //    Fluttertoast.showToast(msg: "Please upload pan card");
    //    return;
    //  }}else{if(files.panCard == null){
    //    Fluttertoast.showToast(msg: "Please upload pan card");
    //    return;
    //  }}}

    if (bankAccounts.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill the Bank details");
      return;
    }
    // if (!villageList.contains(farmerData.village)) {
    //   Fluttertoast.showToast(
    //       msg: "Invalid Village", toastLength: Toast.LENGTH_LONG);
    //   return;
    // }
    setBusy(true);
    if (formKey.currentState!.validate()) {
      // Fluttertoast.showToast(msg: "Farmer Added");
      await uploadFiles();
      // await uploadpassbook();
      farmerData.bankDetails = bankAccounts;
      bool res = false;
      if (isEdit == true) {
        Logger().i(farmerData.workflowState);
        if (farmerData.workflowState == "New" ||
            farmerData.workflowState == "Approved" ||
            farmerData.workflowState == "Rejected") {
          farmerData.workflowState = "Pending For Agriculture Officer";
        }
        if (farmerData.workflowState == "Pending") {
          farmerData.workflowState = "Pending";
        }
        res = await FarmerService().updateFarmer(farmerData);
        if (res) {
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
            Navigator.pop(context);
          }
        }
      } else {
        res = await FarmerService().addFarmer(farmerData);
        if (res) {
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
            Navigator.pop(context);
          }
        }
      }
    }
    if (villageList.isEmpty) {
      final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
      final SharedPreferences prefs = await prefs0;
      prefs.clear();
      if (context.mounted) {
        setBusy(false);
        Navigator.popAndPushNamed(context, Routes.loginViewScreen);
        Logger().i('logged out success');
      }
    }
    setBusy(false);
  }

////////////////////////////////// aadhar functions////////////////////////////////
  String? validateAadhar(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Aadhar card number';
    }

    if (value.replaceAll(' ', '').length != 12) {
      return 'Aadhar card number should be exactly 12 digits';
    }
    // Additional validation rules can be added if needed.
    return null;
  }

  void onAadharChanged(String value) {
    String formattedAadhar = _formatAadhar(value);
    int selectionIndex = aadharNumberController.selection.baseOffset +
        formattedAadhar.length -
        aadharNumberController.text.length;
    aadharNumberController.value = TextEditingValue(
      text: formattedAadhar,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
    farmerData.aadhaarNumber = aadharNumberController.text.replaceAll(" ", '');
  }

  String _formatAadhar(String value) {
    value = value.replaceAll(' ', ''); // Remove existing spaces
    if (value.length > 4) {
      value = '${value.substring(0, 4)} ${value.substring(4, value.length)}';
    }
    if (value.length > 9) {
      value = '${value.substring(0, 9)} ${value.substring(9, value.length)}';
    }
    return value;
  }

/////////////////////////////////////////////////////////////////////////////
//////////////////////////////////pan number////////////////////////////////
  String? validatePanNumber(String? value) {
    if (farmerData.isHarvester == 1) {
      if (value == null || value.isEmpty) {
        return 'Please enter PAN number';
      }
      if (value.replaceAll(' ', '').length != 10) {
        return 'PAN number should be exactly 10 characters';
      }
    }
    // Additional validation rules can be added if needed.
    return null;
  }

  void onPanNumberChanged(String value) {
    String formattedPanNumber = _formatPanNumber(value);
    panNumberController.value = TextEditingValue(
      text: formattedPanNumber,
      selection: TextSelection.collapsed(offset: formattedPanNumber.length),
    );
    farmerData.panNumber = panNumberController.text.replaceAll(" ", '');
  }

  String _formatPanNumber(String value) {
    value = value.replaceAll(' ', ''); // Remove existing spaces
    if (value.length > 5) {
      value = '${value.substring(0, 5)} ${value.substring(5, value.length)}';
    }
    return value;
  }

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////// mobile number////////////////////////////////

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    }
    if (value.replaceAll(" ", "").length != 10) {
      return 'Mobile number should be exactly 10 digits';
    }
    // Additional validation rules can be added if needed.
    return null;
  }

  void onMobileNumberChanged(String value) {
    String formattedMobileNumber = formatMobileNumber(value);
    mobileNumberController.value = TextEditingValue(
      text: formattedMobileNumber,
      selection: TextSelection.collapsed(offset: formattedMobileNumber.length),
    );
    farmerData.mobileNumber = mobileNumberController.text.replaceAll(" ", '');
  }

  String formatMobileNumber(String value) {
    value = value.replaceAll(' ', ''); // Remove existing spaces
    if (value.length > 3) {
      value = '${value.substring(0, 3)} ${value.substring(3, value.length)}';
    }
    if (value.length > 7) {
      value = '${value.substring(0, 7)} ${value.substring(7, value.length)}';
    }
    return value;
  }
  //////////////////////////////////////////////////////////////////////////

  ///////////////////////////////// /for dob////////////////////////////////
  bool isValidDateFormat(String input) {
    // Implement your validation logic here, for example using regular expressions
    // This is a simplified example; you might want to use a more robust validation approach
    RegExp dateRegExp = RegExp(r'^\d{2}-\d{2}-\d{4}$');
    return dateRegExp.hasMatch(input);
  }

  String? validateDob(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Date of Birth';
    }
    if (errorMessage.isNotEmpty) {
      Text(
        errorMessage,
        style: const TextStyle(color: Colors.red),
      );
    }
    return null;
  }

  void onDobChanged(String value) {
    String formattedDate = DateInputHelper.formatInput(value);
    bool isValidDate = DateInputHelper.isValidDate(formattedDate);
    dobController.value = dobController.value.copyWith(
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
      farmerData.dateOfBirth =
          DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now());
      // Format selectedDate as "YYYY-MM-DD" string

      if (selectedDate != null) {
        DateTime currentDate = DateTime.now();
        // Logger().i(currentDate);
        num age = currentDate.year - selectedDate!.year;
        if (currentDate.month < selectedDate!.month ||
            (currentDate.month == selectedDate!.month &&
                currentDate.day < selectedDate!.day)) {
          age--;
        }

        ageController.value = TextEditingValue(
          text: age.toString(),
        );
        farmerData.age = age.toString();
        notifyListeners();
      } else {
        ageController.value = const TextEditingValue(
          text: "0",
        );
      }
    } else {
      errorMessage = 'Invalid date';
      ageController.text = '0';
    }
  }

  String errorMessage = '';

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////// for gender //////////////////////////////////////////////////
  String? _selectedGender;
  final List<String> _genders = ['Male', 'Female', 'Other'];

  String? get selectedGender => _selectedGender;
  List<String> get genders => _genders;

  void setSelectedGender(String? gender) {
    _selectedGender = gender;
    farmerData.gender = _selectedGender;
    notifyListeners();
  }

  bool shouldShowCheckbox(String item) {
    if (role == true) {
      // Show checkboxes for "Far" and "Mem" only if the role is "Slip Boy"
      return item == "Far" || item == "Mem";
    } else {
      // Show checkboxes for all items for other roles
      return true;
    }
  }

  void setSelectedPlant(String? plant) {
    farmerData.branch = plant;
    notifyListeners();
  }

  String? selectedVendorGroup;
  void setSelectedVendorGroup(String? vender) {
    selectedVendorGroup = vender;
    farmerData.supplierGroup = vender;
    notifyListeners();
  }

  String? selectedVillage;
  String? selectedoffice;
  String? selectedtaluka;

  void setSelectedVillage(String? village) {
    selectedVillage = village;
    farmerData.village = selectedVillage;
    final selectedRouteData =
        villageList.firstWhere((routeData) => routeData.name == village);
    selectedoffice = selectedRouteData.circleOffice;
    selectedtaluka = selectedRouteData.taluka;
    Logger().i(selectedVillage);
    farmerData.circleOffice = selectedoffice;
    farmerData.taluka = selectedtaluka;
    Logger().i(farmerData.circleOffice);
    notifyListeners();
  }

  void setSelectedcircleoffice(String? office) {
    selectedoffice = office;
    farmerData.circleOffice = selectedoffice;
    notifyListeners();
  }

  void setSelectedBank(BankMaster bank) async {
    bankandbranch=bank.bankAndBranch ?? "";
    bankName = bank.name ?? "";
    branchifscCode = bank.ifscCode ?? "";
    Logger().i(bank.toJson());
    notifyListeners();
  }

  void setSelectedBranch(String? bankbranch) {
    bankandbranch = bankbranch ?? "";

  }

  // final List<String> _selectedItems = [];
  //
  // List<String> get selectedItems => _selectedItems;
  String? selectedRole;


  Set<String> selectedRoleforservice = <String>{};
  String? _selectedRole;

  String? get SelectedRole => _selectedRole;



  bool isLoading = false;
  bool transporter = false;
  bool harvester = false;
  bool farmer = false;
  bool member = false;
  bool drip = false;
  bool nursery = false;

  void setTransporter(bool value) {
    transporter = value;
    notifyListeners();
  }

  void setHarvester(bool value) {
    harvester = value;
    notifyListeners();
  }

  void setFarmer(bool value) {
    farmer = value;
    notifyListeners();
  }

  void setDrip(bool value) {
    drip = value;
    notifyListeners();
  }

  void setNursery(bool value) {
    nursery = value;
    notifyListeners();
  }

  void setRole(String role, bool value) {
    switch (role) {
      case 'Farmer':
        farmer = value;
        break;
      case 'Harvester':
        harvester = value;
        break;
      case 'Transporter':
        transporter = value;
        break;
      case 'Drip':
        drip = value;
        break;
      case 'Nursery':
        nursery = value;
        break;
    }
    notifyListeners();
  }

  // void setMember(bool value) {
  //   member = value;
  //   notifyListeners();
  // }

  void toggleItem(String item) {
    // Logger().i(farmerData.isHarvester);
    if (_selectedItems.contains(item)) {
      _selectedItems.remove(item);
      // 'Transporter', 'Harvester', 'Farmer', 'Member'
      if (item == items[0]) {
        farmerData.isTransporter = 0;
        notifyListeners();
      }
      if (item == items[1]) {
        farmerData.isHarvester = 0;
        notifyListeners();
      }
      if (item == items[2]) {
        farmerData.isFarmer = 0;
        notifyListeners();
      }
      if (item == items[3]) {
        farmerData.isMember = 0;
        notifyListeners();
      }
      if (item == items[4]) {
        farmerData.drip = 0;
        notifyListeners();
      }
      if (item == items[5]) {
        farmerData.nursery = 0;
        notifyListeners();
      }
    } else {
      _selectedItems.add(item);
      if (item == items[0]) {
        farmerData.isTransporter = 1;
        notifyListeners();
      }
      if (item == items[1]) {
        farmerData.isHarvester = 1;
        notifyListeners();
      }
      if (item == items[2]) {
        farmerData.isFarmer = 1;
        notifyListeners();
      }
      if (item == items[3]) {
        farmerData.isMember = 1;
        notifyListeners();
      }
      if (item == items[4]) {
        farmerData.drip = 1;
        notifyListeners();
      }
      if (item == items[5]) {
        farmerData.nursery = 1;
        notifyListeners();
      }
    }
  }
  ///////////////////////////////////////////////////////////////////////

  /////////////////////////////// for adhar upload//////////////////////

  // Variable to hold the selected PDF file
  Files files = Files();

  // Function to open file picker and select PDF file
  Future<void> selectPdf(String fileType, ImageSource source) async {
    try {
      final result = await ImagePicker().pickImage(source: source);
      if (result != null) {
        // print("SIZE BEFORE: ${result.files.single.size}");
        setBusy(true);
        File? compressedFile = await compressFile(fileFromXFile(result));
        // print("SIZE BEFORE: ${compressedFile?.lengthSync()}");
        files.setFile(fileType, compressedFile);
        setBusy(false);
        notifyListeners();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error while picking an image or document: $e');
    }
  }

  Future<void> selectPdfpassbook(String fileType, ImageSource source) async {
    try {
      final result = await ImagePicker().pickImage(source: source);
      if (result != null) {
        setBusy(true);
        File? compressedFile = await compressFile(fileFromXFile(result));

        passbookattch = compressedFile?.path ?? "";
        Fluttertoast.showToast(
            backgroundColor: const Color(0xFF006C50),
            msg: "Passbook attached successfully.");
        setBusy(false);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error while picking an image or document: $e');
      Logger().e(e);
    }
    notifyListeners();
  }

  // Function to upload the selected PDF file (Aadhar card)
  Future<void> uploadFiles() async {
    String aadharUrl = await FarmerService().uploadDocs(files.adharCard);
    if (aadharUrl == "" && isEdit == false) {
      // Fluttertoast.showToast(msg: "Failed to upload Aadhar");
    }
    String panUrl = await FarmerService().uploadDocs(files.panCard);
    if (panUrl == "" && isEdit == false) {
      // Fluttertoast.showToast(msg: "Failed to upload Pan");
    }

    String letterUrl = await FarmerService().uploadDocs(files.consentLetter);
    if (letterUrl == "" && isEdit == false) {
      // Fluttertoast.showToast(msg: "Failed to upload Letter");
    }

    farmerData.aadhaarCard =
        aadharUrl == "" ? farmerData.aadhaarCard : aadharUrl;
    farmerData.panCard = panUrl == "" ? farmerData.panCard : panUrl;

    farmerData.consentLetter =
        letterUrl == "" ? farmerData.consentLetter : letterUrl;
  }


  Future<void> uploadPassbook(int index) async {

    try {
      if (passbookattch.isEmpty) {
        Fluttertoast.showToast(
          msg: "No passbook attachment provided",
          toastLength: Toast.LENGTH_LONG,
        );
        return;
      }

      final file = File(passbookattch);
      if (!await file.exists()) {
        Fluttertoast.showToast(
          msg: "Passbook file does not exist",
          toastLength: Toast.LENGTH_LONG,
        );
        return;
      }

      String bankUrl = await FarmerService().uploadDocs(file);
      if (bankUrl.isNotEmpty) {
        if (index == -1) {
          bankPassbookUrls.add(bankUrl);
        } else {
          bankPassbookUrls[index] = bankUrl;
        }
        passbookattch = bankUrl; // Update the attachment URL
      } else {
        Fluttertoast.showToast(msg: "Failed to upload Bank");
      }
    } catch (e) {
      Logger().e(e);
      Fluttertoast.showToast(
        msg: "Error uploading passbook: $e",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  // Future<void> uploadpassbook(int index) async {
  //   print("INDEX IS: $index");
  //   if (index == -1) {
  //     // bankPassbookUrls.add("");
  //     String bankUrl = await FarmerService().uploadDocs(File(passbookattch));
  //     if (bankUrl.isNotEmpty) {
  //       bankPassbookUrls.add(bankUrl);
  //       passbookattch = bankUrl; // Update the attachment URL
  //     } else {
  //       Fluttertoast.showToast(msg: "Failed to upload Bank");
  //     }
  //   } else {
  //     String bankUrl = await FarmerService().uploadDocs(File(passbookattch));
  //     if (bankUrl.isNotEmpty) {
  //       bankPassbookUrls[index] = (bankUrl);
  //       passbookattch = bankUrl; // Update the attachment URL
  //     } else {
  //       Fluttertoast.showToast(msg: "Failed to upload Bank");
  //     }
  //   }
  //
  // }

  // Function to check if a PDF file is selected
  bool isFileSelected(String fileType) {
    return files.getFile(fileType) != null;
  }

  ////////////////// Adhar Upload End ///////////////////

  ////////////////// validators ////////////////////////////////////

  String? validatePlant(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Plant';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Age';
    }
    if (value.length == 3) {
      return 'Please Enter Valid Age';
    }
    Logger().i(value.length);
    return null;
  }

  String? validatename(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the vendor name';
    }
    return null;
  }

  String? validateVandorGroup(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Vendor Group';
    }
    return null;
  }

  String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Gender';
    }
    return null;
  }

  String? validateVillage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Village';
    }
    return null;
  }

  String? validateRole(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Role';
    }
    return null;
  }

  Future<void> validateForm(BuildContext context, int index) async {
    if (bankAccounts.any((account) =>
    account.accountNumber == accountNumber && idbankedit == false)) {
      Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: "Account number already exists",
        toastLength: Toast.LENGTH_LONG,
      );
      return;
    }

    if (bankAccounts.any((account) =>
    account.bankPassbook == passbookattch && idbankedit == false)) {
      Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: "Passbook attachment already exists",
        toastLength: Toast.LENGTH_LONG,
      );
      return;
    }

    if (index == -1) {
      if (!isRoleAlreadyPresent(bankName)) {
        Fluttertoast.showToast(
          msg: "Role is already exist",
          toastLength: Toast.LENGTH_LONG,
        );
        return;
      }
    }

    setBusy(true); // Set the loading state
    Navigator.pop(context);
    try {
      Logger().i(passbookattch);
      if (index != -1) {
        Logger().i(bankAccounts[index].bankPassbook);
      }
      await uploadPassbook(index);
      submitBankAccount(index);
      setBusy(false);

      Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: idbankedit == true
            ? "Bank is edited successfully"
            : 'Bank is added successfully',
        toastLength: Toast.LENGTH_LONG,
      );
      resetBankVariables();
      passbookattch = "";
    } catch (e) {
      Logger().e(e);
      setBusy(false);
      // Handle any errors here...
    } finally {
      setBusy(false); // Set the loading state
    }
  }


  bool getRoleValue(String role, int index) {
    if (index >= 0 && index < bankAccounts.length) {
      final account = bankAccounts[index];
      switch (role) {
        case 'farmer':
          return account.farmer == 1;
        case 'harvester':
          return account.harvester == 1;
        case 'transporter':
          return account.transporter == 1;
      }
    }
    return false; // Default to false if index is out of bounds or role is unknown
  }

  // Set the value of a specific role for a bank account at the given index
  void setRoleValue(String role, int index, bool newValue) {
    if (index >= 0 && index < bankAccounts.length) {
      final account = bankAccounts[index];
      switch (role) {
        case 'farmer':
          account.farmer = newValue ? 1 : 0;
          break;
        case 'harvester':
          account.harvester = newValue ? 1 : 0;
          break;
        case 'transporter':
          account.transporter = newValue ? 1 : 0;
          break;
      }
      notifyListeners(); // Notify listeners to update the UI if necessary
    }
  }

  void setSelectedfarmerbool(bool? farmer) {
    notifyListeners();
    setRole("Farmer", farmer ?? false);
    notifyListeners();
  }

  void submitBankAccount(int index) {
    if (index != -1) {
      bankAccounts[index].farmer = farmer ? 1 : 0;
      bankAccounts[index].harvester = harvester ? 1 : 0;
      bankAccounts[index].transporter = transporter ? 1 : 0;
      bankAccounts[index].drip = drip ? 1 : 0;
      bankAccounts[index].nursery = nursery ? 1 : 0;
      bankAccounts[index].bankAndBranch = bankandbranch;
      bankAccounts[index].name=bankName;
      bankAccounts[index].branchifscCode = branchifscCode;
      bankAccounts[index].accountNumber = accountNumber;
      bankAccounts[index].bankPassbook = passbookattch;
      notifyListeners();
      return;
    }

    bankAccounts.add(BankDetails(
        farmer: farmer ? 1 : 0,
        harvester: harvester ? 1 : 0,
        transporter: transporter ? 1 : 0,
        drip: drip ? 1 : 0,
        nursery: nursery ? 1 : 0,
        bankName: bankName,
        bankAndBranch: bankandbranch,
        branchifscCode: branchifscCode,
        accountNumber: accountNumber,
        bankPassbook: passbookattch));
    notifyListeners();
  }

  bool idbankedit = false;
  void setValuesToBankVaribles(int index) {
    if (index != -1) {
      if (index >= bankAccounts.length) {
        return;
      }
      idbankedit = true;
      // Reset all roles to false
      farmer = false;
      harvester = false;
      transporter = false;
      drip = false;
      nursery = false;
      if (bankAccounts[index].farmer == 1) {
        farmer = true;
      }
      if (bankAccounts[index].harvester == 1) {
        harvester = true;
      }
      if (bankAccounts[index].transporter == 1) {
        transporter = true;
      }
      if (bankAccounts[index].drip == 1) {
        drip = true;
      }
      if (bankAccounts[index].nursery == 1) {
        nursery = true;
      }
      bankandbranch = bankAccounts[index].bankAndBranch ?? "";
      bankName = bankAccounts[index].bankName ?? "";
      branchifscCode = bankAccounts[index].branchifscCode!;
      accountNumber = bankAccounts[index].accountNumber!;
      passbookattch = bankAccounts[index].bankPassbook ?? "";
    }
    notifyListeners();
  }

  void resetBankVariables() {
    idbankedit = false;
    farmer = farmerData.isFarmer == 1 ? true : false;
    harvester = false;
    transporter = false;
    drip = false;
    nursery = false;
    bankName = "";
    branchifscCode = "";
    accountNumber = "";
    bankandbranch = "";
    passbookattch = "";
  }

  bool isRoleAlreadyPresent(String field) {
    for (var i in bankAccounts) {
      switch (field) {
        case 'Transporter':
          if (i.transporter == 1) return false;
          break;
        case 'Harvester':
          if (i.harvester == 1) return false;
          break;
        case 'Farmer':
          if (i.farmer == 1) return false;
          break;
      }
    }
    return true;
  }

  String? validateBankName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a bank name';
    }
    return null;
  }

  String? validateBranch(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a bank branch';
    }
    return null;
  }

  String? validateBranchIfscCode(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a branch IFSC code';
    }

    return null;
  }

  String? validateAccountNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an account number';
    }

    return null;
  }

  void updateFarmerName(String value) {
    supplierNameController.text = value;
    farmerData.supplierName = supplierNameController.text;
    notifyListeners();
  }

  void deleteBankAccount(int index) {
    if (index >= 0 && index < bankAccounts.length) {
      bankAccounts.removeAt(index);
      notifyListeners();
    }
  }

  getVisibility() {
    return isEdit;
  }

  String? getFileFromFarmer(String filetype) {
    if (filetype == kAadharpdf) return farmerData.aadhaarCard;
    if (filetype == kPanpdf) return farmerData.panCard;
    if (filetype == kBankpdf) {
      return passbookattch;
    }
    if (filetype == kConcentpdf) return farmerData.consentLetter;
    return null;
  }

  List<File?>? getFileFromFileTypepassbook(String filetype) {
    if (filetype == kBankpdf) return List.from(files.bankPassbooks);
    return [];
  }

  File? getFileFromFileType(String filetype) {
    if (filetype == kAadharpdf) return files.adharCard;
    if (filetype == kPanpdf) return files.panCard;
    if (filetype == kConcentpdf) return files.consentLetter;
    return null;
  }

  void handlePassbookPdf(int index) {
    files.bankPassbooks.add(File(passbookattch));
    passbookattch = "";
    notifyListeners();
  }
}

class UppercaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}

class Files {
  File? adharCard;
  List<File?> bankPassbooks = []; // Use a list to store multiple bank passbooks
  File? panCard;
  File? consentLetter;

  File? getBankPassbookFileByIndex(int index) {
    if (index >= 0 && index < bankPassbooks.length) {
      return bankPassbooks[bankPassbooks.length - 1];
    }
    return null;
  }

  File? getFile(String fileType) {
    if (fileType == kAadharpdf) {
      return adharCard;
    }
    if (fileType == kPanpdf) {
      return panCard;
    }
    // if (fileType == kBankpdf) {
    //   // Return the first bank passbook in the list, you might need to handle multiple entries differently
    //   return bankPassbooks.isNotEmpty ? bankPassbooks.first : null;
    // }
    if (fileType == kConcentpdf) {
      return consentLetter;
    }

    return null;
  }

  void addBankPassbook(File? file) {
    bankPassbooks.add(file); // Add a new bank passbook to the list
  }

  void removeBankPassbook(int index) {
    if (index >= 0 && index < bankPassbooks.length) {
      bankPassbooks.removeAt(index); // Remove a bank passbook from the list
    }
  }

  // void setFilepassbook(String fileType, List<File?> files) {
  //   if (fileType == kBankpdf) {
  //     // bankPassbooks = List.from(files);
  //     passbookattch = files[0]?.path;
  //   }
  // }

  void setFile(String fileType, File? file) {
    if (fileType == kAadharpdf) {
      adharCard = file;
    }
    if (fileType == kPanpdf) {
      panCard = file;
    }

    if (fileType == kConcentpdf) {
      consentLetter = file;
    }
  }
}
