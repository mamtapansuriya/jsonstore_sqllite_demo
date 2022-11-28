import 'dart:convert';

List<Cashback> cashbackFromJson(String str) => List<Cashback>.from(json.decode(str).map((x) => Cashback.fromJson(x)));

String cashbackToJson(List<Cashback> cashback) => json.encode(List<dynamic>.from(cashback.map((x) => x.toJson())));

class Cashback {
  Cashback({
    this.descriptionMd,
    this.id,
    this.previousValue,
    this.type,
    this.value,
    this.valueLabel,
  });

  String? descriptionMd;
  String? id;
  double? previousValue;
  String? type;
  double? value;
  dynamic valueLabel;

  factory Cashback.fromJson(Map<String, dynamic> json) => Cashback(
        descriptionMd: json["description_md"],
        id: json["id"],
        previousValue: json["previous_value"].toDouble(),
        type: json["type"],
        value: json["value"].toDouble(),
        valueLabel: json["valueLabel"],
      );

  Map<String, dynamic> toJson() => {
        "description_md": descriptionMd,
        "id": id,
        "previous_value": previousValue,
        "type": type,
        "value": value,
        "valueLabel": valueLabel,
      };
  Map<String, dynamic> toDataBase() => {
        "descriptionMd": descriptionMd,
        "id": id,
        "previousValue": previousValue.toString(),
        "type": type,
        "value": value.toString(),
        "valueLabel": valueLabel.toString(),
      };
}
