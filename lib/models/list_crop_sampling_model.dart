class ListSampling {
  String? id;
  String? plantattionRatooningDate;
  String? name;
  double? averageBrix;
  String? growerName;
  String? route;
  String? formNumber;
  String? cropVariety;

  ListSampling(
      {this.id,
      this.plantattionRatooningDate,
      this.name,
      this.averageBrix,
      this.growerName,
      this.route,
      this.formNumber,
      this.cropVariety});

  ListSampling.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plantattionRatooningDate = json['plantattion_ratooning_date'];
    name = json['name'];
    averageBrix = json['average_brix'];
    growerName = json['grower_name'];
    route = json['route'];
    formNumber = json['form_number'];
    cropVariety = json['crop_variety'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plantattion_ratooning_date'] = this.plantattionRatooningDate;
    data['name'] = this.name;
    data['average_brix'] = this.averageBrix;
    data['grower_name'] = this.growerName;
    data['route'] = this.route;
    data['form_number'] = this.formNumber;
    data['crop_variety'] = this.cropVariety;
    return data;
  }
}
