// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<VoucherModel> welcomeFromJson(String str) => List<VoucherModel>.from(json.decode(str).map((x) => VoucherModel.fromJson(x)));

String welcomeToJson(List<VoucherModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VoucherModel {
  VoucherModel({
    this.id,
    this.code,
    this.conditionMd,
    this.endDate,
    this.descriptionMd,
  });

  String? id;
  String? code;
  dynamic conditionMd;
  int? endDate;
  String? descriptionMd;

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["id"],
        code: json["code"],
        conditionMd: json["conditionMd"],
        endDate: json["endDate"],
        descriptionMd: json["descriptionMd"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "conditionMd": conditionMd,
        "endDate": endDate,
        "descriptionMd": descriptionMd,
      };
  Map<String, dynamic> toDatabase() => {
        "id": id,
        "code": code,
        "conditionMd": conditionMd.toString(),
        "endDate": endDate.toString(),
        "descriptionMd": descriptionMd,
      };
}
