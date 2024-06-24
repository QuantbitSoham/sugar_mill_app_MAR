class TripSheetMasters {
  List<String>? season;
  List<String>? plant;
  List<TransportInfo>? transportInfo;
  List<WaterSupplierList>? waterSupplierList;
  List<CaneRoute>? caneRoute;

  TripSheetMasters(
      {this.season,
        this.plant,
        this.transportInfo,
        this.waterSupplierList,
        this.caneRoute});

  TripSheetMasters.fromJson(Map<String, dynamic> json) {
    season = json['season'].cast<String>();
    plant = json['plant'].cast<String>();
    if (json['Transport_Info'] != null) {
      transportInfo = <TransportInfo>[];
      json['Transport_Info'].forEach((v) {
        transportInfo!.add(new TransportInfo.fromJson(v));
      });
    }
    if (json['Water_Supplier_List'] != null) {
      waterSupplierList = <WaterSupplierList>[];
      json['Water_Supplier_List'].forEach((v) {
        waterSupplierList!.add(new WaterSupplierList.fromJson(v));
      });
    }
    if (json['cane_route'] != null) {
      caneRoute = <CaneRoute>[];
      json['cane_route'].forEach((v) {
        caneRoute!.add(new CaneRoute.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    data['plant'] = this.plant;
    if (this.transportInfo != null) {
      data['Transport_Info'] =
          this.transportInfo!.map((v) => v.toJson()).toList();
    }
    if (this.waterSupplierList != null) {
      data['Water_Supplier_List'] =
          this.waterSupplierList!.map((v) => v.toJson()).toList();
    }
    if (this.caneRoute != null) {
      data['cane_route'] = this.caneRoute!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransportInfo {
  String? name;
  String? oldNo;
  String? transporterName;
  String? transporterCode;
  String? harvesterCode;
  String? harvesterName;
  String? vehicleType;
  String? vehicleNo;
  String? trolly1;
  String? trolly2;
  String? gangType;

  TransportInfo(
      {this.name,
        this.oldNo,
        this.transporterName,
        this.transporterCode,
        this.harvesterCode,
        this.harvesterName,
        this.vehicleType,
        this.vehicleNo,
        this.trolly1,
        this.trolly2,
        this.gangType});

  TransportInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    oldNo = json['old_no'];
    transporterName = json['transporter_name'];
    transporterCode = json['transporter_code'];
    harvesterCode = json['harvester_code'];
    harvesterName = json['harvester_name'];
    vehicleType = json['vehicle_type'];
    vehicleNo = json['vehicle_no'];
    trolly1 = json['trolly_1'];
    trolly2 = json['trolly_2'];
    gangType = json['gang_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['old_no'] = this.oldNo;
    data['transporter_name'] = this.transporterName;
    data['transporter_code'] = this.transporterCode;
    data['harvester_code'] = this.harvesterCode;
    data['harvester_name'] = this.harvesterName;
    data['vehicle_type'] = this.vehicleType;
    data['vehicle_no'] = this.vehicleNo;
    data['trolly_1'] = this.trolly1;
    data['trolly_2'] = this.trolly2;
    data['gang_type'] = this.gangType;
    return data;
  }
}

class WaterSupplierList {
  String? name;
  String? supplierName;
  String? existingSupplierCode;

  WaterSupplierList({this.name, this.supplierName, this.existingSupplierCode});

  WaterSupplierList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    supplierName = json['supplier_name'];
    existingSupplierCode = json['existing_supplier_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['supplier_name'] = this.supplierName;
    data['existing_supplier_code'] = this.existingSupplierCode;
    return data;
  }
}

class CaneRoute {
  String? route;
  double? distanceKm;
  String? name;
  String? taluka;
  String? circleOffice;
  String? village;

  CaneRoute(
      {this.route,
        this.distanceKm,
        this.name,
        this.taluka,
        this.circleOffice,
        this.village});

  CaneRoute.fromJson(Map<String, dynamic> json) {
    route = json['route'];
    distanceKm = json['distance_km'];
    name = json['name'];
    taluka = json['taluka'];
    circleOffice = json['circle_office'];
    village = json['village'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['route'] = this.route;
    data['distance_km'] = this.distanceKm;
    data['name'] = this.name;
    data['taluka'] = this.taluka;
    data['circle_office'] = this.circleOffice;
    data['village'] = this.village;
    return data;
  }
}
