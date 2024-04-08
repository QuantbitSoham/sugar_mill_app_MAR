class aadharData {
  String? emailMobileStatus;
  String? referenceid;
  String? name;
  String? dob;
  String? gender;
  String? careof;
  String? district;
  String? landmark;
  String? house;
  String? location;
  String? pincode;
  String? postoffice;
  String? state;
  String? street;
  String? subdistrict;
  String? vtc;
  String? aadhaarLast4Digit;
  String? aadhaarLastDigit;
  bool? email;
  bool? mobile;

  aadharData(
      {this.emailMobileStatus,
        this.referenceid,
        this.name,
        this.dob,
        this.gender,
        this.careof,
        this.district,
        this.landmark,
        this.house,
        this.location,
        this.pincode,
        this.postoffice,
        this.state,
        this.street,
        this.subdistrict,
        this.vtc,
        this.aadhaarLast4Digit,
        this.aadhaarLastDigit,
        this.email,
        this.mobile});

  aadharData.fromJson(Map<String, dynamic> json) {
    emailMobileStatus = json['email_mobile_status'];
    referenceid = json['referenceid'];
    name = json['name'];
    dob = json['dob'];
    gender = json['gender'];
    careof = json['careof'];
    district = json['district'];
    landmark = json['landmark'];
    house = json['house'];
    location = json['location'];
    pincode = json['pincode'];
    postoffice = json['postoffice'];
    state = json['state'];
    street = json['street'];
    subdistrict = json['subdistrict'];
    vtc = json['vtc'];
    aadhaarLast4Digit = json['aadhaar_last_4_digit'];
    aadhaarLastDigit = json['aadhaar_last_digit'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email_mobile_status'] = emailMobileStatus;
    data['referenceid'] = referenceid;
    data['name'] = name;
    data['dob'] = dob;
    data['gender'] = gender;
    data['careof'] = careof;
    data['district'] = district;
    data['landmark'] = landmark;
    data['house'] = house;
    data['location'] = location;
    data['pincode'] = pincode;
    data['postoffice'] = postoffice;
    data['state'] = state;
    data['street'] = street;
    data['subdistrict'] = subdistrict;
    data['vtc'] = vtc;
    data['aadhaar_last_4_digit'] = aadhaarLast4Digit;
    data['aadhaar_last_digit'] = aadhaarLastDigit;
    data['email'] = email;
    data['mobile'] = mobile;
    return data;
  }
}
