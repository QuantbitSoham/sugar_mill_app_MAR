class UserWiseRegistrationModel {
  String? circle;
  double? newPlJune;
  double? newRtJune;
  double? newPlJuly;
  double? newRtJuly;
  double? newPlAugust;
  double? newRtAugust;
  double? newPlSeptember;
  double? newRtSeptember;
  double? newPlOctober;
  double? newRtOctober;
  double? newPlNovember;
  double? newRtNovember;
  double? newPlDecember;
  double? newRtDecember;
  double? newPlJanuary;
  double? newRtJanuary;
  double? newPlFebruary;
  double? newRtFebruary;
  double? newPlMarch;
  double? newRtMarch;
  double? newPlTotal;
  double? newRtTotal;
  double? total;

  UserWiseRegistrationModel(
      {this.circle,
        this.newPlJune,
        this.newRtJune,
        this.newPlJuly,
        this.newRtJuly,
        this.newPlAugust,
        this.newRtAugust,
        this.newPlSeptember,
        this.newRtSeptember,
        this.newPlOctober,
        this.newRtOctober,
        this.newPlNovember,
        this.newRtNovember,
        this.newPlDecember,
        this.newRtDecember,
        this.newPlJanuary,
        this.newRtJanuary,
        this.newPlFebruary,
        this.newRtFebruary,
        this.newPlMarch,
        this.newRtMarch,
        this.newPlTotal,
        this.newRtTotal,
        this.total});

  UserWiseRegistrationModel.fromJson(Map<String, dynamic> json) {
    circle = json['circle'];
    newPlJune = json['new_pl_june'];
    newRtJune = json['new_rt_june'];
    newPlJuly = json['new_pl_july'];
    newRtJuly = json['new_rt_july'];
    newPlAugust = json['new_pl_august'];
    newRtAugust = json['new_rt_august'];
    newPlSeptember = json['new_pl_september'];
    newRtSeptember = json['new_rt_september'];
    newPlOctober = json['new_pl_october'];
    newRtOctober = json['new_rt_october'];
    newPlNovember = json['new_pl_november'];
    newRtNovember = json['new_rt_november'];
    newPlDecember = json['new_pl_december'];
    newRtDecember = json['new_rt_december'];
    newPlJanuary = json['new_pl_january'];
    newRtJanuary = json['new_rt_january'];
    newPlFebruary = json['new_pl_february'];
    newRtFebruary = json['new_rt_february'];
    newPlMarch = json['new_pl_march'];
    newRtMarch = json['new_rt_march'];
    newPlTotal = json['new_pl_total'];
    newRtTotal = json['new_rt_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['circle'] = circle;
    data['new_pl_june'] = newPlJune;
    data['new_rt_june'] = newRtJune;
    data['new_pl_july'] = newPlJuly;
    data['new_rt_july'] = newRtJuly;
    data['new_pl_august'] = newPlAugust;
    data['new_rt_august'] = newRtAugust;
    data['new_pl_september'] = newPlSeptember;
    data['new_rt_september'] = newRtSeptember;
    data['new_pl_october'] = newPlOctober;
    data['new_rt_october'] = newRtOctober;
    data['new_pl_november'] = newPlNovember;
    data['new_rt_november'] = newRtNovember;
    data['new_pl_december'] = newPlDecember;
    data['new_rt_december'] = newRtDecember;
    data['new_pl_january'] = newPlJanuary;
    data['new_rt_january'] = newRtJanuary;
    data['new_pl_february'] = newPlFebruary;
    data['new_rt_february'] = newRtFebruary;
    data['new_pl_march'] = newPlMarch;
    data['new_rt_march'] = newRtMarch;
    data['new_pl_total'] = newPlTotal;
    data['new_rt_total'] = newRtTotal;
    data['total'] = total;
    return data;
  }
}
