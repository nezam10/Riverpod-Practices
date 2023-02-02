// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(dynamic str) => List<UserModel>.from(
    (str as List<dynamic>).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id,
    this.userId,
    this.sponsorId,
    this.fName,
    this.mName,
    this.lName,
    this.phone,
    this.email,
    this.status,
    this.verified,
    this.locale,
    this.baseCurrency,
    this.profileUrl,
    this.transferLimit,
    // this.transLimit,
    this.userPin,
  });

  final int? id;
  final String? userId;
  final String? sponsorId;
  final String? fName;
  final String? mName;
  final String? lName;
  final String? phone;
  final String? email;
  final int? status;
  final int? verified;
  final String? locale;
  final String? baseCurrency;
  final String? profileUrl;
  final String? transferLimit;
  // final List<TransLimitModel>? transLimit;
  final UserPin? userPin;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        sponsorId: json["sponsor_id"] == null ? null : json["sponsor_id"],
        fName: json["f_name"] == null ? null : json["f_name"],
        mName: json["m_name"] == null ? null : json["m_name"],
        lName: json["l_name"] == null ? null : json["l_name"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        status: json["status"] == null ? null : json["status"],
        verified: json["verified"] == null ? null : json["verified"],
        locale: json["locale"] == null ? null : json["locale"],
        baseCurrency:
            json["base_currency"] == null ? null : json["base_currency"],
        profileUrl: json["profile_url"] == null ? null : json["profile_url"],
        transferLimit:
            json["transfer_limit"] == null ? null : json["transfer_limit"],
        userPin: json["user_pin"] == null
            ? null
            : UserPin.fromJson(json["user_pin"]),
      );
  factory UserModel.fromJsonRegistation(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        fName: json["f_name"],
        lName: json["l_name"],
        phone: json["phone"],
        email: json["email"],
        status: json["status"],
        locale: json["locale"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "sponsor_id": sponsorId == null ? null : sponsorId,
        "f_name": fName == null ? null : fName,
        "m_name": mName == null ? null : mName,
        "l_name": lName == null ? null : lName,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "status": status == null ? null : status,
        "verified": verified == null ? null : verified,
        "locale": locale == null ? null : locale,
        "base_currency": baseCurrency == null ? null : baseCurrency,
        "profile_url": profileUrl == null ? null : profileUrl,
        "transfer_limit": transferLimit == null ? null : transferLimit,
        // "trans_limit": transLimit == null
        //     ? null
        //     : List<dynamic>.from(transLimit!.map((x) => x.toJson())),
      };
}

class UserPin {
  UserPin({
    this.id,
    this.userId,
    this.skey,
    this.pin,
    this.datetime,
  });

  final int? id;
  final String? userId;
  final String? skey;
  final String? pin;
  final DateTime? datetime;

  factory UserPin.fromJson(Map<String, dynamic> json) => UserPin(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        skey: json["skey"] == null ? null : json["skey"],
        pin: json["pin"] == null ? null : json["pin"],
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
      );
}
