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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['owner'] = owner;
    data['modified_by'] = modifiedBy;
    data['docstatus'] = docstatus;
    data['date'] = date;
    data['slip_no'] = slipNo;
    data['season'] = season;
    data['branch'] = branch;
    data['plot_no'] = plotNo;
    data['plat_no_id'] = platNoId;
    data['farmer_code'] = farmerCode;
    data['farmer_name'] = farmerName;
    data['field_village'] = fieldVillage;
    data['cane_variety'] = caneVariety;
    data['plantation_date'] = plantationDate;
    data['survery_no'] = surveryNo;
    data['area_acre'] = areaAcre;
    data['route_name'] = routeName;
    data['apply_flat_rate'] = applyFlatRate;
    data['distance'] = distance;
    data['flat_rate'] = flatRate;
    data['burn_cane'] = burnCane;
    data['deduction'] = deduction;

    data['cartno'] = cartno;
    data['transporter_code'] = transporterCode;
    data['old_transporter_code'] = oldTransporterCode;
    data['transporter'] = transporter;
    data['transporter_name'] = transporterName;
    data['vehicle_type'] = vehicleType;
    data['harvester_code'] = harvesterCode;
    data['harvester_name'] = harvesterName;
    data['harvesting_code__ht'] = harvestingCodeHt;
    data['harvester_code_old'] = harvesterCodeOld;
    data['harvester_code_h'] = harvesterCodeH;
    data['harvester_name_h'] = harvesterNameH;
    data['gang_type'] = gangType;
    data['vehicle_number'] = vehicleNumber;
    data['tolly_1'] = tolly1;
    data['tolly_2'] = tolly2;
    data['rope'] = rope;
    data['water_supplier'] = waterSupplier;
    data['water_supplier_name'] = waterSupplierName;
    data['water_share'] = waterShare;
    data['percentage'] = percentage;
    data['slip_boy'] = slipBoy;
    data['circle_office'] = circleOffice;
    data['vendor_code'] = vendorCode;
    data['bas_pali_flag'] = basPaliFlag;
    data['tripsheet_no'] = tripsheetNo;
    data['cane_weight_flag'] = caneWeightFlag;
    data['can_slip_flag'] = canSlipFlag;
    data['token_no'] = tokenNo;
    data['doctype'] = doctype;
    return data;
  }
}
