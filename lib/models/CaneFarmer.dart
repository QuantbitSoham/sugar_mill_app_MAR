class caneFarmer {
  String? supplierName;
  String? existingSupplierCode;
  String? name;

  caneFarmer({this.supplierName, this.existingSupplierCode, this.name});

  caneFarmer.fromJson(Map<String, dynamic> json) {
    supplierName = json['supplier_name'];
    existingSupplierCode = json['existing_supplier_code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supplier_name'] = this.supplierName;
    data['existing_supplier_code'] = this.existingSupplierCode;
    data['name'] = this.name;
    return data;
  }
}
