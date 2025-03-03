class YardBalance {
  String? vehicleType;
  int? slipCount;
  int? yardBalance;

  YardBalance({this.vehicleType, this.slipCount, this.yardBalance});

  YardBalance.fromJson(Map<String, dynamic> json) {
    vehicleType = json['vehicle_type'];
    slipCount = json['slip_count'];
    yardBalance = json['yard_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicle_type'] = this.vehicleType;
    data['slip_count'] = this.slipCount;
    data['yard_balance'] = this.yardBalance;
    return data;
  }
}
