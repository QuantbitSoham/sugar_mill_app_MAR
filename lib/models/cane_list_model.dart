class CaneListModel {
  String? plantationStatus;
  String? routeName;
  String? cropVariety;
  String? name;
  String? growerCode;
  String? growerName;
  int? plotNo;
  String? plantattionRatooningDate;
  String? surveyNumber;

  CaneListModel(
      {this.plantationStatus,
        this.routeName,
        this.cropVariety,
        this.name,
        this.plotNo,
        this.growerCode,
        this.growerName,
        this.plantattionRatooningDate,
        this.surveyNumber});

  CaneListModel.fromJson(Map<String, dynamic> json) {
    plantationStatus = json['plantation_status'];
    routeName = json['route_name'];
    cropVariety = json['crop_variety'];
    name = json['name'];
    plotNo=json["plot_no"];
    growerCode = json['grower_code'];
    growerName = json['grower_name'];
    plantattionRatooningDate = json['plantattion_ratooning_date'];
    surveyNumber = json['survey_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['plantation_status'] = plantationStatus;
    data['route_name'] = routeName;
    data['crop_variety'] = cropVariety;
    data['name'] = name;
    data['plot_no']=plotNo;
    data['grower_code'] = growerCode;
    data['grower_name'] = growerName;
    data['plantattion_ratooning_date'] = plantattionRatooningDate;
    data['survey_number'] = surveyNumber;
    return data;
  }
}
