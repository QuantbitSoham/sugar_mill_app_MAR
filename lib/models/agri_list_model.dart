// "route_name","grower_name","crop_variety","date","area","village","name","survey_number","cane_registration_id"

class AgriListModel {
  String? routeName;
  String? growerName;
  String? cropVariety;
  String? date;
  double? area;
  String? village;
  String? name;
  String? surveyNumber;
  String? caneRegistrationId;

  AgriListModel(
      {this.routeName,
      this.growerName,
        this.cropVariety,
        this.date,
        this.area,
        this.village,
        this.name,
        this.surveyNumber,this.caneRegistrationId});

  AgriListModel.fromJson(Map<String, dynamic> json) {
    routeName = json['route_name'];
    growerName=json['grower_name'];
    cropVariety = json['crop_variety'];
    date = json['date'];
    area = json['area'];
    village = json['village'];
    name = json['name'];
    surveyNumber = json['survey_number'];
    caneRegistrationId=json['cane_registration_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['route_name'] = routeName;
    data['grower_name']=growerName;
    data['crop_variety'] = cropVariety;
    data['date'] = date;
    data['area'] = area;
    data['village'] = village;
    data['name'] = name;
    data['survey_number'] = surveyNumber;
    data['cane_registration_id']=caneRegistrationId;
    return data;
  }
}
