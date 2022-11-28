import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) => List<CategoriesModel>.from(json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  CategoriesModel({
    this.id,
    this.name,
    this.parentIds,
  });

  String? id;
  Name? name;
  List<String>? parentIds;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        id: json["id"],
        name: Name.fromJson(json["name"]),
        parentIds: List<String>.from(json["parent_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name?.toJson(),
        "parent_ids": List<dynamic>.from(parentIds!.map((x) => x)),
      };
  Map<String, dynamic> toDataBase() => {
        "id": id,
        "name": nameToJson(name!.toJson()),
        "parent_ids": List<dynamic>.from(parentIds!.map((x) => x)).toString(),
      };
}

class Name {
  Name({
    this.de,
    this.es,
    this.it,
    this.en,
    this.us,
  });

  String? de;
  String? es;
  String? it;
  String? en;
  String? us;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        de: json["de"],
        es: json["es"],
        it: json["it"],
        en: json["en"],
        us: json["us"],
      );

  Map<String, dynamic> toJson() => {
        "de": de,
        "es": es,
        "it": it,
        "en": en,
        "us": us,
      };
}

Name nameFromJson(String str) => Name.fromJson(json.decode(str));

String nameToJson(Map<String, dynamic> data) => json.encode(nameToDataBase(data));

Map<String, dynamic> nameToDataBase(data) => {
      "de": data['de'],
      "es": data['es'],
      "it": data['it'],
      "en": data['en'],
      "us": data['us'],
    };
