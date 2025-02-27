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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_log_type'] = lastLogType;
    data['emp_name'] = empName;
    data['email'] = email;
    data['company'] = company;
    data['last_log_time'] = lastLogTime;
    return data;
  }
}
