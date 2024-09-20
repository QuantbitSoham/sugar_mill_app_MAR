class caneRoute {
  String? route;
  double? distanceKm;
  String? name;

  caneRoute({this.route, this.distanceKm, this.name});

  caneRoute.fromJson(Map<String, dynamic> json) {
    route = json['route'];
    distanceKm = json['distance_km'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['route'] = this.route;
    data['distance_km'] = this.distanceKm;
    data['name'] = this.name;
    return data;
  }
}
