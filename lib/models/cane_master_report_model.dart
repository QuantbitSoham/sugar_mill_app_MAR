class CaneMasterReportModel {
  String? name;
  String? creation;
  String? modified;
  String? modifiedBy;
  String? owner;
  int? docstatus;
  int? idx;
  String? season;
  String? plantationStatus;
  String? plantName;
  String? formNumber;
  String? growerCode;
  String? growerName;
  String? mobileNo;
  String? companyName;
  String? isKisanCard;
  String? surveyNumber;
  String? area;
  String? country;
  String? circleOffice;
  String? taluka;
  String? district;
  String? states;
  String? route;
  double? routeKm;
  String? cropName;
  String? cropType;
  String? cropVariety;
  double? areaAcrs;
  String? plantationSystem;
  String? plantattionRatooningDate;
  String? irrigationSource;
  String? irrigationMethod;
  String? soilType;
  String? seedMaterial;
  String? roadSide;
  String? supervisorName;
  String? longitude;
  String? latitude;
  String? city;
  String? state;
  String? amendedFrom;
  String? status;
  String? nUserTags;
  String? nComments;
  String? nAssign;
  String? nLikedBy;
  String? isMachine;
  String? workflowState;
  String? pj;
  String? seedType;
  String? developmentPlot;
  String? provisionalDate;
  String? basalDate;
  String? vendorCode;
  String? village;
  String? routeName;
  int? plotNo;
  String? isKisanCardUpdatedDate;

  CaneMasterReportModel(
      {this.name,
        this.creation,
        this.modified,
        this.modifiedBy,
        this.owner,
        this.docstatus,
        this.idx,
        this.season,
        this.plantationStatus,
        this.plantName,
        this.formNumber,
        this.growerCode,
        this.growerName,
        this.mobileNo,
        this.companyName,
        this.isKisanCard,
        this.surveyNumber,
        this.area,
        this.country,
        this.circleOffice,
        this.taluka,
        this.district,
        this.states,
        this.route,
        this.routeKm,
        this.cropName,
        this.cropType,
        this.cropVariety,
        this.areaAcrs,
        this.plantationSystem,
        this.plantattionRatooningDate,
        this.irrigationSource,
        this.irrigationMethod,
        this.soilType,
        this.seedMaterial,
        this.roadSide,
        this.supervisorName,
        this.longitude,
        this.latitude,
        this.city,
        this.state,
        this.amendedFrom,
        this.status,
        this.nUserTags,
        this.nComments,
        this.nAssign,
        this.nLikedBy,
        this.isMachine,
        this.workflowState,
        this.pj,
        this.seedType,
        this.developmentPlot,
        this.provisionalDate,
        this.basalDate,
        this.vendorCode,
        this.village,
        this.routeName,
        this.plotNo,
        this.isKisanCardUpdatedDate});

  CaneMasterReportModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    owner = json['owner'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    season = json['season'];
    plantationStatus = json['plantation_status'];
    plantName = json['plant_name'];
    formNumber = json['form_number'];
    growerCode = json['grower_code'];
    growerName = json['grower_name'];
    mobileNo = json['mobile_no'];
    companyName = json['company_name'];
    isKisanCard = json['is_kisan_card'];
    surveyNumber = json['survey_number'];
    area = json['area'];
    country = json['country'];
    circleOffice = json['circle_office'];
    taluka = json['taluka'];
    district = json['district'];
    states = json['states'];
    route = json['route'];
    routeKm = json['route_km'];
    cropName = json['crop_name'];
    cropType = json['crop_type'];
    cropVariety = json['crop_variety'];
    areaAcrs = json['area_acrs'];
    plantationSystem = json['plantation_system'];
    plantattionRatooningDate = json['plantattion_ratooning_date'];
    irrigationSource = json['irrigation_source'];
    irrigationMethod = json['irrigation_method'];
    soilType = json['soil_type'];
    seedMaterial = json['seed_material'];
    roadSide = json['road_side'];
    supervisorName = json['supervisor_name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    city = json['city'];
    state = json['state'];
    amendedFrom = json['amended_from'];
    status = json['status'];
    nUserTags = json['_user_tags'];
    nComments = json['_comments'];
    nAssign = json['_assign'];
    nLikedBy = json['_liked_by'];
    isMachine = json['is_machine'];
    workflowState = json['workflow_state'];
    pj = json['pj'];
    seedType = json['seed_type'];
    developmentPlot = json['development_plot'];
    provisionalDate = json['provisional_date'];
    basalDate = json['basal_date'];
    vendorCode = json['vendor_code'];
    village = json['village'];
    routeName = json['route_name'];
    plotNo = json['plot_no'];
    isKisanCardUpdatedDate = json['is_kisan_card__updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['creation'] = this.creation;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['owner'] = this.owner;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['season'] = this.season;
    data['plantation_status'] = this.plantationStatus;
    data['plant_name'] = this.plantName;
    data['form_number'] = this.formNumber;
    data['grower_code'] = this.growerCode;
    data['grower_name'] = this.growerName;
    data['mobile_no'] = this.mobileNo;
    data['company_name'] = this.companyName;
    data['is_kisan_card'] = this.isKisanCard;
    data['survey_number'] = this.surveyNumber;
    data['area'] = this.area;
    data['country'] = this.country;
    data['circle_office'] = this.circleOffice;
    data['taluka'] = this.taluka;
    data['district'] = this.district;
    data['states'] = this.states;
    data['route'] = this.route;
    data['route_km'] = this.routeKm;
    data['crop_name'] = this.cropName;
    data['crop_type'] = this.cropType;
    data['crop_variety'] = this.cropVariety;
    data['area_acrs'] = this.areaAcrs;
    data['plantation_system'] = this.plantationSystem;
    data['plantattion_ratooning_date'] = this.plantattionRatooningDate;
    data['irrigation_source'] = this.irrigationSource;
    data['irrigation_method'] = this.irrigationMethod;
    data['soil_type'] = this.soilType;
    data['seed_material'] = this.seedMaterial;
    data['road_side'] = this.roadSide;
    data['supervisor_name'] = this.supervisorName;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['city'] = this.city;
    data['state'] = this.state;
    data['amended_from'] = this.amendedFrom;
    data['status'] = this.status;
    data['_user_tags'] = this.nUserTags;
    data['_comments'] = this.nComments;
    data['_assign'] = this.nAssign;
    data['_liked_by'] = this.nLikedBy;
    data['is_machine'] = this.isMachine;
    data['workflow_state'] = this.workflowState;
    data['pj'] = this.pj;
    data['seed_type'] = this.seedType;
    data['development_plot'] = this.developmentPlot;
    data['provisional_date'] = this.provisionalDate;
    data['basal_date'] = this.basalDate;
    data['vendor_code'] = this.vendorCode;
    data['village'] = this.village;
    data['route_name'] = this.routeName;
    data['plot_no'] = this.plotNo;
    data['is_kisan_card__updated_date'] = this.isKisanCardUpdatedDate;
    return data;
  }
}
