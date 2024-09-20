class TripSheetSearch {
  String? name;
  String? farmerName;
  String? fieldVillage;
  int? slipNo;
  String? transporterName;
  String? circleOffice;
  String? season;
  String? status;

  TripSheetSearch(
      {

        this.name,
      this.farmerName,
      this.fieldVillage,
  this.status,
      this.slipNo,
      this.transporterName,
      this.circleOffice,
      this.season});

  TripSheetSearch.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    farmerName = json['farmer_name'];
    fieldVillage = json['field_village'];
    slipNo = json['slip_no'];
    status=json["status"];
    transporterName = json['transporter_name'];
    circleOffice = json['circle_office'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['farmer_name'] = farmerName;
    data['field_village'] = fieldVillage;
    data['slip_no'] = slipNo;
    data["status"]=status;
    data['transporter_name'] = transporterName;
    data['circle_office'] = circleOffice;
    data['season'] = season;
    return data;
  }
}
