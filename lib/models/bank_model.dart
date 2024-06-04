class BankMaster {
  String? name;
  String? bankAndBranch;
  String? branch;
  String? ifscCode;

  BankMaster({this.name
    ,this.bankAndBranch, this.branch, this.ifscCode});

  BankMaster.fromJson(Map<String, dynamic> json) {
    name=json['name'];
    bankAndBranch = json['bank_and_branch'];
    branch = json['branch'];
    ifscCode = json['ifsc_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name']=name;
    data['bank_and_branch'] = bankAndBranch;
    data['branch'] = branch;
    data['ifsc_code'] = ifscCode;
    return data;
  }
}
