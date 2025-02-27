class AgriCane {
  String? vendorCode;
  double? routeKm;
  String? growerName;
  String? growerCode;
  String? area;
  String? cropType;
  String? cropVariety;
  String? plantattionRatooningDate;
  double? areaAcrs;
  String? plantName;
  int? plotNo;
  String? name;
  String? soilType;
  String? season;

  AgriCane(
      {this.vendorCode,
      this.routeKm,
      this.growerName,
      this.growerCode,
      this.area,
      this.plotNo,
      this.cropType,
      this.cropVariety,
      this.plantattionRatooningDate,
      this.areaAcrs,
      this.plantName,
      this.name,
      this.soilType,
      this.season});

  AgriCane.fromJson(Map<String, dynamic> json) {
    vendorCode = json['vendor_code'];
    routeKm = json['route_km'];
    growerName = json['grower_name'];
    growerCode = json['grower_code'];
    area = json['area'];
    cropType = json['crop_type'];
    plotNo=json['plot_no'];
    cropVariety = json['crop_variety'];
    plantattionRatooningDate = json['plantattion_ratooning_date'];
    areaAcrs = json['area_acrs'];
    plantName = json['plant_name'];
    name = json['name'];
    soilType = json['soil_type'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['vendor_code'] = vendorCode;
    data['route_km'] = routeKm;
    data['grower_name'] = growerName;
    data['grower_code'] = growerCode;
    data['area'] = area;
    data['plot_no']=plotNo;
    data['crop_type'] = cropType;
    data['crop_variety'] = cropVariety;
    data['plantattion_ratooning_date'] = plantattionRatooningDate;
    data['area_acrs'] = areaAcrs;
    data['plant_name'] = plantName;
    data['name'] = name;
    data['soil_type'] = soilType;
    data['season'] = season;
    return data;
  }
}
