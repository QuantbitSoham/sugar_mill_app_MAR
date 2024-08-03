class ListSampling {
  String? id;
  String? plantattionRatooningDate;
  double? averageBrix;
  String? growerName;
  String? route;
  String? formNumber;
  String? cropVariety;
  String? name;
  String? area;

  ListSampling(
      {this.id,
        this.plantattionRatooningDate,
        this.averageBrix,
        this.growerName,
        this.route,
        this.formNumber,
        this.cropVariety,
        this.name,
        this.area});

  ListSampling.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plantattionRatooningDate = json['plantattion_ratooning_date'];
    averageBrix = json['average_brix'];
    growerName = json['grower_name'];
    route = json['route'];
    formNumber = json['form_number'];
    cropVariety = json['crop_variety'];
    name = json['name'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['plantattion_ratooning_date'] = plantattionRatooningDate;
    data['average_brix'] = averageBrix;
    data['grower_name'] = growerName;
    data['route'] = route;
    data['form_number'] = formNumber;
    data['crop_variety'] = cropVariety;
    data['name'] = name;
    data['area'] = area;
    return data;
  }
}
