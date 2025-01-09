class UserInfoModel {
  int? id;
  String? userId;
  String? fullname;
  String? gender;
  String? phoneNumber;
  String? isSeller;

  // Constructor
  UserInfoModel({
    this.id,
    this.userId,
    this.fullname,
    this.gender,
    this.phoneNumber,
    this.isSeller,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'],
      userId: json['userId'],
      fullname: json['fullname'],
      gender: json['gender'],
      phoneNumber: json['phone_number'],
      isSeller: json['isSeller'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'fullname': fullname,
      'gender': gender,
      'phone_number': phoneNumber,
      'isSeller': isSeller,
    };
  }
}
