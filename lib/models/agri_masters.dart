class AgriMasters {
  List<String>? season;
  List<ItemList>? itemList;
  List<FertilizerItemList>? fertilizerItemList;
  List<Village>? village;

  AgriMasters(
      {this.season, this.itemList, this.fertilizerItemList, this.village});

  AgriMasters.fromJson(Map<String, dynamic> json) {
    season = json['season'].cast<String>();
    if (json['Item_List'] != null) {
      itemList = <ItemList>[];
      json['Item_List'].forEach((v) {
        itemList!.add(new ItemList.fromJson(v));
      });
    }
    if (json['Fertilizer_Item_List'] != null) {
      fertilizerItemList = <FertilizerItemList>[];
      json['Fertilizer_Item_List'].forEach((v) {
        fertilizerItemList!.add(new FertilizerItemList.fromJson(v));
      });
    }
    if (json['village'] != null) {
      village = <Village>[];
      json['village'].forEach((v) {
        village!.add(new Village.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    if (this.itemList != null) {
      data['Item_List'] = this.itemList!.map((v) => v.toJson()).toList();
    }
    if (this.fertilizerItemList != null) {
      data['Fertilizer_Item_List'] =
          this.fertilizerItemList!.map((v) => v.toJson()).toList();
    }
    if (this.village != null) {
      data['village'] = this.village!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemList {
  String? name;
  String? itemName;
  String? itemCode;
  double? rate;

  ItemList({this.name, this.itemName, this.itemCode, this.rate});

  ItemList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    itemName = json['item_name'];
    itemCode = json['item_code'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['item_name'] = this.itemName;
    data['item_code'] = this.itemCode;
    data['rate'] = this.rate;
    return data;
  }
}

class FertilizerItemList {
  String? name;
  String? itemName;
  String? itemCode;
  double? weightPerUnit;
  String? itemTaxTemp;
  String? actualQty;
  double? rate;

  FertilizerItemList(
      {this.name,
        this.itemName,
        this.itemCode,
        this.weightPerUnit,
        this.itemTaxTemp,
        this.actualQty,
        this.rate});

  FertilizerItemList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    itemName = json['item_name'];
    itemCode = json['item_code'];
    weightPerUnit = json['weight_per_unit'];
    itemTaxTemp = json['item_tax_temp'];
    actualQty = json['actual_qty'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['item_name'] = this.itemName;
    data['item_code'] = this.itemCode;
    data['weight_per_unit'] = this.weightPerUnit;
    data['item_tax_temp'] = this.itemTaxTemp;
    data['actual_qty'] = this.actualQty;
    data['rate'] = this.rate;
    return data;
  }
}

class Village {
  String? taluka;
  String? circleOffice;
  String? name;

  Village({this.taluka, this.circleOffice, this.name});

  Village.fromJson(Map<String, dynamic> json) {
    taluka = json['taluka'];
    circleOffice = json['circle_office'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taluka'] = this.taluka;
    data['circle_office'] = this.circleOffice;
    data['name'] = this.name;
    return data;
  }
}
