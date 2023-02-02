// To parse this JSON data, do
//
//     final companyInfoModel = companyInfoModelFromMap(jsonString);

import 'dart:convert';

List<CompanyInfoModel> companyInfoModelFromMap(dynamic str) =>
    List<CompanyInfoModel>.from(
        (str as List<dynamic>).map((x) => CompanyInfoModel.fromMap(x)));

String companyInfoModelToMap(List<CompanyInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CompanyInfoModel {
  CompanyInfoModel({
    this.title,
    this.description,
    this.email,
    this.phone,
    this.logo,
    this.favicon,
  });

  final String? title;
  final String? description;
  final String? email;
  final String? phone;
  final String? logo;
  final String? favicon;

  factory CompanyInfoModel.fromMap(Map<String, dynamic> json) =>
      CompanyInfoModel(
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        logo: json["logo"] == null ? null : json["logo"],
        favicon: json["favicon"] == null ? null : json["favicon"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "logo": logo == null ? null : logo,
        "favicon": favicon == null ? null : favicon,
      };
}
