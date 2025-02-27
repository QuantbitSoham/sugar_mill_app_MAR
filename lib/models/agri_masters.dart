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
        itemList!.add(ItemList.fromJson(v));
      });
    }
    if (json['Fertilizer_Item_List'] != null) {
      fertilizerItemList = <FertilizerItemList>[];
      json['Fertilizer_Item_List'].forEach((v) {
        fertilizerItemList!.add(FertilizerItemList.fromJson(v));
      });
    }
    if (json['village'] != null) {
      village = <Village>[];
      json['village'].forEach((v) {
        village!.add(Village.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season'] = season;
    if (itemList != null) {
      data['Item_List'] = itemList!.map((v) => v.toJson()).toList();
    }
    if (fertilizerItemList != null) {
      data['Fertilizer_Item_List'] =
          fertilizerItemList!.map((v) => v.toJson()).toList();
    }
    if (village != null) {
      data['village'] = village!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['item_name'] = itemName;
    data['item_code'] = itemCode;
    data['rate'] = rate;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['item_name'] = itemName;
    data['item_code'] = itemCode;
    data['weight_per_unit'] = weightPerUnit;
    data['item_tax_temp'] = itemTaxTemp;
    data['actual_qty'] = actualQty;
    data['rate'] = rate;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taluka'] = taluka;
    data['circle_office'] = circleOffice;
    data['name'] = name;
    return data;
  }
}
