class UserWiseRegistrationModel {
  String? user;
  String? village;
  double? plJune;
  int? rtJune;
  int? plJuly;
  int? rtJuly;
  int? plAugust;
  int? rtAugust;
  int? plSeptember;
  int? rtSeptember;
  int? plOctober;
  int? rtOctober;
  int? plNovember;
  int? rtNovember;
  int? plDecember;
  int? rtDecember;
  int? plJanuary;
  int? rtJanuary;
  int? plFebruary;
  int? rtFebruary;
  int? plMarch;
  int? rtMarch;
  double? plTotal;
  int? rtTotal;
  double? total;

  UserWiseRegistrationModel(
      {this.user,
      this.village,
      this.plJune,
      this.rtJune,
      this.plJuly,
      this.rtJuly,
      this.plAugust,
      this.rtAugust,
      this.plSeptember,
      this.rtSeptember,
      this.plOctober,
      this.rtOctober,
      this.plNovember,
      this.rtNovember,
      this.plDecember,
      this.rtDecember,
      this.plJanuary,
      this.rtJanuary,
      this.plFebruary,
      this.rtFebruary,
      this.plMarch,
      this.rtMarch,
      this.plTotal,
      this.rtTotal,
      this.total});

  UserWiseRegistrationModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    village = json['village'];
    plJune = json['pl_june'];
    rtJune = json['rt_june'];
    plJuly = json['pl_july'];
    rtJuly = json['rt_july'];
    plAugust = json['pl_august'];
    rtAugust = json['rt_august'];
    plSeptember = json['pl_september'];
    rtSeptember = json['rt_september'];
    plOctober = json['pl_october'];
    rtOctober = json['rt_october'];
    plNovember = json['pl_november'];
    rtNovember = json['rt_november'];
    plDecember = json['pl_december'];
    rtDecember = json['rt_december'];
    plJanuary = json['pl_january'];
    rtJanuary = json['rt_january'];
    plFebruary = json['pl_february'];
    rtFebruary = json['rt_february'];
    plMarch = json['pl_march'];
    rtMarch = json['rt_march'];
    plTotal = json['pl_total'];
    rtTotal = json['rt_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = user;
    data['village'] = village;
    data['pl_june'] = plJune;
    data['rt_june'] = rtJune;
    data['pl_july'] = plJuly;
    data['rt_july'] = rtJuly;
    data['pl_august'] = plAugust;
    data['rt_august'] = rtAugust;
    data['pl_september'] = plSeptember;
    data['rt_september'] = rtSeptember;
    data['pl_october'] = plOctober;
    data['rt_october'] = rtOctober;
    data['pl_november'] = plNovember;
    data['rt_november'] = rtNovember;
    data['pl_december'] = plDecember;
    data['rt_december'] = rtDecember;
    data['pl_january'] = plJanuary;
    data['rt_january'] = rtJanuary;
    data['pl_february'] = plFebruary;
    data['rt_february'] = rtFebruary;
    data['pl_march'] = plMarch;
    data['rt_march'] = rtMarch;
    data['pl_total'] = plTotal;
    data['rt_total'] = rtTotal;
    data['total'] = total;
    return data;
  }
}
