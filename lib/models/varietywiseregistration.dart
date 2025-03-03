class VarietyWisePlotReportmodel {
  String? circle;
  double? vCF0517PL;
  double? vCF0517RT;
  double? sNK13374PL;
  double? sNK13374RT;
  double? cOC671PL;
  double? cOC671RT;
  double? cO10001PL;
  double? cO10001RT;
  double? cO86032PL;
  double? cO86032RT;
  double? cO92005PL;
  double? cO92005RT;
  double? cO92020PL;
  double? cO92020RT;
  double? cO8005PL;
  double? cO8005RT;
  double? cO98005PL;
  double? cO98005RT;
  double? cOC94012PL;
  double? cOC94012RT;
  double? cOC265PL;
  double? cOC265RT;
  double? i9293PL;
  double? i9293RT;
  double? cO1110PL;
  double? cO1110RT;
  double? cO7704PL;
  double? cO7704RT;
  double? cO8014PL;
  double? cO8014RT;
  double? cO8021PL;
  double? cO8021RT;
  double? oTHERPL;
  double? oTHERRT;
  double? totalPL;
  double? totalRT;
  double? total;

  VarietyWisePlotReportmodel(
      {this.circle,
      this.vCF0517PL,
      this.vCF0517RT,
      this.sNK13374PL,
      this.sNK13374RT,
      this.cOC671PL,
      this.cOC671RT,
      this.cO10001PL,
      this.cO10001RT,
      this.cO86032PL,
      this.cO86032RT,
      this.cO92005PL,
      this.cO92005RT,
      this.cO92020PL,
      this.cO92020RT,
      this.cO8005PL,
      this.cO8005RT,
      this.cO98005PL,
      this.cO98005RT,
      this.cOC94012PL,
      this.cOC94012RT,
      this.cOC265PL,
      this.cOC265RT,
      this.i9293PL,
      this.i9293RT,
      this.cO1110PL,
      this.cO1110RT,
      this.cO7704PL,
      this.cO7704RT,
      this.cO8014PL,
      this.cO8014RT,
      this.cO8021PL,
      this.cO8021RT,
      this.oTHERPL,
      this.oTHERRT,
      this.totalPL,
      this.totalRT,
      this.total});

  VarietyWisePlotReportmodel.fromJson(Map<String, dynamic> json) {
    circle = json['circle'];
    vCF0517PL = json['VCF 0517_PL'];
    vCF0517RT = json['VCF 0517_RT'];
    sNK13374PL = json['SNK13374_PL'];
    sNK13374RT = json['SNK13374_RT'];
    cOC671PL = json['COC671_PL'];
    cOC671RT = json['COC671_RT'];
    cO10001PL = json['CO10001_PL'];
    cO10001RT = json['CO10001_RT'];
    cO86032PL = json['CO86032_PL'];
    cO86032RT = json['CO86032_RT'];
    cO92005PL = json['CO92005_PL'];
    cO92005RT = json['CO92005_RT'];
    cO92020PL = json['CO92020_PL'];
    cO92020RT = json['CO92020_RT'];
    cO8005PL = json['CO8005_PL'];
    cO8005RT = json['CO8005_RT'];
    cO98005PL = json['CO98005_PL'];
    cO98005RT = json['CO98005_RT'];
    cOC94012PL = json['COC94012_PL'];
    cOC94012RT = json['COC94012_RT'];
    cOC265PL = json['COC 265_PL'];
    cOC265RT = json['COC 265_RT'];
    i9293PL = json['9293_PL'];
    i9293RT = json['9293_RT'];
    cO1110PL = json['CO1110_PL'];
    cO1110RT = json['CO1110_RT'];
    cO7704PL = json['CO7704_PL'];
    cO7704RT = json['CO7704_RT'];
    cO8014PL = json['CO8014_PL'];
    cO8014RT = json['CO8014_RT'];
    cO8021PL = json['CO8021_PL'];
    cO8021RT = json['CO8021_RT'];
    oTHERPL = json['OTHER_PL'];
    oTHERRT = json['OTHER_RT'];
    totalPL = json['total_PL'];
    totalRT = json['total_RT'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['circle'] = this.circle;
    data['VCF 0517_PL'] = this.vCF0517PL;
    data['VCF 0517_RT'] = this.vCF0517RT;
    data['SNK13374_PL'] = this.sNK13374PL;
    data['SNK13374_RT'] = this.sNK13374RT;
    data['COC671_PL'] = this.cOC671PL;
    data['COC671_RT'] = this.cOC671RT;
    data['CO10001_PL'] = this.cO10001PL;
    data['CO10001_RT'] = this.cO10001RT;
    data['CO86032_PL'] = this.cO86032PL;
    data['CO86032_RT'] = this.cO86032RT;
    data['CO92005_PL'] = this.cO92005PL;
    data['CO92005_RT'] = this.cO92005RT;
    data['CO92020_PL'] = this.cO92020PL;
    data['CO92020_RT'] = this.cO92020RT;
    data['CO8005_PL'] = this.cO8005PL;
    data['CO8005_RT'] = this.cO8005RT;
    data['CO98005_PL'] = this.cO98005PL;
    data['CO98005_RT'] = this.cO98005RT;
    data['COC94012_PL'] = this.cOC94012PL;
    data['COC94012_RT'] = this.cOC94012RT;
    data['COC 265_PL'] = this.cOC265PL;
    data['COC 265_RT'] = this.cOC265RT;
    data['9293_PL'] = this.i9293PL;
    data['9293_RT'] = this.i9293RT;
    data['CO1110_PL'] = this.cO1110PL;
    data['CO1110_RT'] = this.cO1110RT;
    data['CO7704_PL'] = this.cO7704PL;
    data['CO7704_RT'] = this.cO7704RT;
    data['CO8014_PL'] = this.cO8014PL;
    data['CO8014_RT'] = this.cO8014RT;
    data['CO8021_PL'] = this.cO8021PL;
    data['CO8021_RT'] = this.cO8021RT;
    data['OTHER_PL'] = this.oTHERPL;
    data['OTHER_RT'] = this.oTHERRT;
    data['total_PL'] = this.totalPL;
    data['total_RT'] = this.totalRT;
    data['total'] = this.total;
    return data;
  }
}
