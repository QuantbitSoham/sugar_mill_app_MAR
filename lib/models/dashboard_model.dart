class Dashboard {
  String? lastLogType;
  String? empName;
  String? email;
  String? company;
  String? lastLogTime;

  Dashboard(
      {this.lastLogType,
        this.empName,
        this.email,
        this.company,
        this.lastLogTime});

  Dashboard.fromJson(Map<String, dynamic> json) {
    lastLogType = json['last_log_type'];
    empName = json['emp_name'];
    email = json['email'];
    company = json['company'];
    lastLogTime = json['last_log_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_log_type'] = this.lastLogType;
    data['emp_name'] = this.empName;
    data['email'] = this.email;
    data['company'] = this.company;
    data['last_log_time'] = this.lastLogTime;
    return data;
  }
}
