class UserInfoUpdateModel {
  String? fullname;
  String? gender;
  String? phoneNumber;
  String? isSeller;

  UserInfoUpdateModel({
    this.fullname,
    this.gender,
    this.phoneNumber,
    this.isSeller,
  });

  factory UserInfoUpdateModel.fromJson(Map<String, dynamic> json) {
    return UserInfoUpdateModel(
      fullname: json['fullname'],
      gender: json['gender'],
      phoneNumber: json['phone_number'],
      isSeller: json['isSeller'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'gender': gender,
      'phone_number': phoneNumber,
      'isSeller': isSeller,
    };
  }
}
