// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'dart:convert';

List<CurrencyModel> currencyModelFromJson(dynamic str) =>
    List<CurrencyModel>.from(
        (str as List<dynamic>).map((x) => CurrencyModel.fromJson(x)));

String currencyModelToJson(List<CurrencyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrencyModel {
  CurrencyModel({
    this.currencyId,
    this.currencyName,
    this.currencyIsoCode,
    this.currencySymbol,
    this.minLimit,
  });

  final int? currencyId;
  final String? currencyName;
  final String? currencyIsoCode;
  final String? currencySymbol;
  final int? minLimit;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        currencyId: json["currency_id"],
        currencyName: json["currency_name"],
        currencyIsoCode: json["currency_iso_code"],
        currencySymbol: json["currency_symbol"],
        minLimit: json["min_limit"],
      );

  Map<String, dynamic> toJson() => {
        "currency_id": currencyId,
        "currency_name": currencyName,
        "currency_iso_code": currencyIsoCode,
        "currency_symbol": currencySymbol,
        "min_limit": minLimit,
      };
}
