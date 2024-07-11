class TripSheet {
  int? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  String? date;
  int? slipNo;
  String? season;
  String? branch;
  String? plotNo;
  String? platNoId;
  String? farmerCode;
  String? farmerName;
  String? fieldVillage;
  String? caneVariety;
  String? plantationDate;
  String? surveryNo;
  double? areaAcre;
  String? routeName;
  int? applyFlatRate;
  double? distance;
  double? flatRate;
  String? burnCane;
  double? deduction;
  int? selfTransporterAndHarvester;
  double? cartno;
  String? transporterCode;
  String? oldTransporterCode;
  String? transporter;
  String? transporterName;
  String? vehicleType;
  String? harvesterCode;
  String? harvesterName;
  String? harvestingCodeHt;
  String? harvesterCodeOld;
  String? harvesterCodeH;
  String? harvesterNameH;
  String? gangType;
  String? vehicleNumber;
  String? tolly1;
  String? tolly2;
  String? rope;
  String? waterSupplier;
  String? waterSupplierName;
  double? waterShare;
  double? percentage;
  String? slipBoy;
  String? circleOffice;
  String? vendorCode;
  int? basPaliFlag;
  String? tripsheetNo;
  int? caneWeightFlag;
  String? canSlipFlag;
  int? tokenNo;
  String? doctype;

  TripSheet(
      {this.name,
        this.owner,
        this.modifiedBy,
        this.docstatus,
        this.date,
        this.slipNo,
        this.season,
        this.branch,
        this.plotNo,
        this.platNoId,
        this.farmerCode,
        this.farmerName,
        this.fieldVillage,
        this.caneVariety,
        this.plantationDate,
        this.surveryNo,
        this.areaAcre,
        this.routeName,
        this.applyFlatRate,
        this.distance,
        this.flatRate,
        this.burnCane,
        this.deduction,
        this.selfTransporterAndHarvester,
        this.cartno,
        this.transporterCode,
        this.oldTransporterCode,
        this.transporter,
        this.transporterName,
        this.vehicleType,
        this.harvesterCode,
        this.harvesterName,
        this.harvestingCodeHt,
        this.harvesterCodeOld,
        this.harvesterCodeH,
        this.harvesterNameH,
        this.gangType,
        this.vehicleNumber,
        this.tolly1,
        this.tolly2,
        this.rope,
        this.waterSupplier,
        this.waterSupplierName,
        this.waterShare,
        this.percentage,
        this.slipBoy,
        this.circleOffice,
        this.vendorCode,
        this.basPaliFlag,
        this.tripsheetNo,
        this.caneWeightFlag,
        this.canSlipFlag,
        this.tokenNo,
        this.doctype});

  TripSheet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    date = json['date'];
    slipNo = json['slip_no'];
    season = json['season'];
    branch = json['branch'];
    plotNo = json['plot_no'];
    platNoId = json['plat_no_id'];
    farmerCode = json['farmer_code'];
    farmerName = json['farmer_name'];
    fieldVillage = json['field_village'];
    caneVariety = json['cane_variety'];
    plantationDate = json['plantation_date'];
    surveryNo = json['survery_no'];
    areaAcre = json['area_acre'];
    routeName = json['route_name'];
    applyFlatRate = json['apply_flat_rate'];
    distance = json['distance'];
    flatRate = json['flat_rate'];
    burnCane = json['burn_cane'];
    deduction = json['deduction'];
    selfTransporterAndHarvester = json['self_transporter_and_harvester'];
    cartno = json['cartno'];
    transporterCode = json['transporter_code'];
    oldTransporterCode = json['old_transporter_code'];
    transporter = json['transporter'];
    transporterName = json['transporter_name'];
    vehicleType = json['vehicle_type'];
    harvesterCode = json['harvester_code'];
    harvesterName = json['harvester_name'];
    harvestingCodeHt = json['harvesting_code__ht'];
    harvesterCodeOld = json['harvester_code_old'];
    harvesterCodeH = json['harvester_code_h'];
    harvesterNameH = json['harvester_name_h'];
    gangType = json['gang_type'];
    vehicleNumber = json['vehicle_number'];
    tolly1 = json['tolly_1'];
    tolly2 = json['tolly_2'];
    rope = json['rope'];
    waterSupplier = json['water_supplier'];
    waterSupplierName = json['water_supplier_name'];
    waterShare = json['water_share'];
    percentage = json['percentage'];
    slipBoy = json['slip_boy'];
    circleOffice = json['circle_office'];
    vendorCode = json['vendor_code'];
    basPaliFlag = json['bas_pali_flag'];
    tripsheetNo = json['tripsheet_no'];
    caneWeightFlag = json['cane_weight_flag'];
    canSlipFlag = json['can_slip_flag'];
    tokenNo = json['token_no'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['date'] = this.date;
    data['slip_no'] = this.slipNo;
    data['season'] = this.season;
    data['branch'] = this.branch;
    data['plot_no'] = this.plotNo;
    data['plat_no_id'] = this.platNoId;
    data['farmer_code'] = this.farmerCode;
    data['farmer_name'] = this.farmerName;
    data['field_village'] = this.fieldVillage;
    data['cane_variety'] = this.caneVariety;
    data['plantation_date'] = this.plantationDate;
    data['survery_no'] = this.surveryNo;
    data['area_acre'] = this.areaAcre;
    data['route_name'] = this.routeName;
    data['apply_flat_rate'] = this.applyFlatRate;
    data['distance'] = this.distance;
    data['flat_rate'] = this.flatRate;
    data['burn_cane'] = this.burnCane;
    data['deduction'] = this.deduction;
    data['self_transporter_and_harvester'] = this.selfTransporterAndHarvester;
    data['cartno'] = this.cartno;
    data['transporter_code'] = this.transporterCode;
    data['old_transporter_code'] = this.oldTransporterCode;
    data['transporter'] = this.transporter;
    data['transporter_name'] = this.transporterName;
    data['vehicle_type'] = this.vehicleType;
    data['harvester_code'] = this.harvesterCode;
    data['harvester_name'] = this.harvesterName;
    data['harvesting_code__ht'] = this.harvestingCodeHt;
    data['harvester_code_old'] = this.harvesterCodeOld;
    data['harvester_code_h'] = this.harvesterCodeH;
    data['harvester_name_h'] = this.harvesterNameH;
    data['gang_type'] = this.gangType;
    data['vehicle_number'] = this.vehicleNumber;
    data['tolly_1'] = this.tolly1;
    data['tolly_2'] = this.tolly2;
    data['rope'] = this.rope;
    data['water_supplier'] = this.waterSupplier;
    data['water_supplier_name'] = this.waterSupplierName;
    data['water_share'] = this.waterShare;
    data['percentage'] = this.percentage;
    data['slip_boy'] = this.slipBoy;
    data['circle_office'] = this.circleOffice;
    data['vendor_code'] = this.vendorCode;
    data['bas_pali_flag'] = this.basPaliFlag;
    data['tripsheet_no'] = this.tripsheetNo;
    data['cane_weight_flag'] = this.caneWeightFlag;
    data['can_slip_flag'] = this.canSlipFlag;
    data['token_no'] = this.tokenNo;
    data['doctype'] = this.doctype;
    return data;
  }
}
