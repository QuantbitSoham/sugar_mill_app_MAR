class CaneMasters {
  List<String>? season;
  List<String>? plant;
  List<String>? caneVariety;
  List<String>? plantationSystem;
  List<String>? seedMaterialUsed;
  List<String>? irrigationMethod;
  List<String>? cropType;
  List<String>? irrigationSource;
  List<String>? soilType;
  List<Village>? village;
  List<CaneRoute>? caneRoute;

  CaneMasters(
      {this.season,
        this.plant,
        this.caneVariety,
        this.plantationSystem,
        this.seedMaterialUsed,
        this.irrigationMethod,
        this.cropType,
        this.irrigationSource,
        this.soilType,
        this.village,
        this.caneRoute});

  CaneMasters.fromJson(Map<String, dynamic> json) {
    season = json['season'].cast<String>();
    plant = json['plant'].cast<String>();
    caneVariety = json['cane_variety'].cast<String>();
    plantationSystem = json['plantation_system'].cast<String>();
    seedMaterialUsed = json['seed_material_used'].cast<String>();
    irrigationMethod = json['irrigation_method'].cast<String>();
    cropType = json['crop_type'].cast<String>();
    irrigationSource = json['irrigation_source'].cast<String>();
    soilType = json['soil_type'].cast<String>();
    if (json['village'] != null) {
      village = <Village>[];
      json['village'].forEach((v) {
        village!.add( Village.fromJson(v));
      });
    }
    if (json['cane_route'] != null) {
      caneRoute = <CaneRoute>[];
      json['cane_route'].forEach((v) {
        caneRoute!.add( CaneRoute.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['season'] = season;
    data['plant'] = plant;
    data['cane_variety'] = caneVariety;
    data['plantation_system'] = plantationSystem;
    data['seed_material_used'] = seedMaterialUsed;
    data['irrigation_method'] = irrigationMethod;
    data['crop_type'] = cropType;
    data['irrigation_source'] = irrigationSource;
    data['soil_type'] = soilType;
    if (village != null) {
      data['village'] = village!.map((v) => v.toJson()).toList();
    }
    if (caneRoute != null) {
      data['cane_route'] = caneRoute!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Village {
  String? taluka;
  String? circleOffice;
  String? name;

  Village({this.taluka, this.circleOffice, this.name});

  Village.fromJson(Map<String, dynamic> json) {
    taluka = json['taluka'];
    circleOffice = json['circle_office'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taluka'] = taluka;
    data['circle_office'] = circleOffice;
    data['name'] = name;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['route'] = route;
    data['distance_km'] = distanceKm;
    data['name'] = name;
    data['taluka'] = taluka;
    data['circle_office'] = circleOffice;
    data['village'] = village;
    return data;
  }
}
