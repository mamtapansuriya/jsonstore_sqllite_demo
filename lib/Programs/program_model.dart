import 'dart:convert';

class Autogenerated {
  Programs programsFromJson(String str) => Programs.fromJson(json.decode(str));

  String programsToJson(Programs data) => json.encode(data.toJson());
  List<Programs>? programs;

  Autogenerated({this.programs});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['programs'] != null) {
      programs = <Programs>[];
      json['programs'].forEach((v) {
        programs!.add(Programs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (programs != null) {
      data['programs'] = programs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Programs {
  List<int>? cashbacks;
  List<int>? categories;
  String? descriptionMd;
  String? externalId;
  String? id;
  String? logoUrl;
  String? name;
  List<String>? tags;
  String? trackingUrl;
  Transaction? dataTransaction;
  List<int>? vouchers;
  String? conditionsMd;
  String? originName;

  Programs(
      {this.cashbacks,
      this.categories,
      this.descriptionMd,
      this.externalId,
      this.id,
      this.logoUrl,
      this.name,
      this.tags,
      this.trackingUrl,
      this.dataTransaction,
      this.vouchers,
      this.conditionsMd,
      this.originName});

  Map<String, dynamic> toDataBase() => {
        "cashbacks": List<dynamic>.from(cashbacks!.map((x) => x)).toString(),
        "categories": List<dynamic>.from(categories!.map((x) => x)).toString(),
        "descriptionMd": descriptionMd,
        "externalId": externalId,
        "id": id,
        "logoUrl": logoUrl,
        "name": name, //nameToJson(name.toJson()),
        "tags": List<dynamic>.from(tags!.map((x) => x)).toString(),
        "trackingUrl": trackingUrl,
        "dataTransaction": transactionToJson(dataTransaction!.toJson()),
        "vouchers": List<dynamic>.from(vouchers!.map((x) => x)).toString(),
        "conditionsMd": conditionsMd,
        "originName": originName,
      };

  Programs.fromJson(Map<String, dynamic> json) {
    cashbacks = json['cashbacks'].cast<int>();
    categories = json['categories'].cast<int>();
    descriptionMd = json['description_md'];
    externalId = json['external_id'];
    id = json['id'];
    logoUrl = json['logo_url'];
    name = json['name'];
    tags = json['tags'].cast<String>();
    trackingUrl = json['tracking_url'];
    dataTransaction = Transaction.fromJson(json['dataTransaction'] ?? {});
    vouchers = json['vouchers'].cast<int>();
    conditionsMd = json['conditions_md'];
    originName = json['origin_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cashbacks'] = cashbacks.toString();
    data['categories'] = categories.toString();
    data['description_md'] = descriptionMd;
    data['external_id'] = externalId;
    data['id'] = id;
    data['logo_url'] = logoUrl;
    data['name'] = name;
    data['tags'] = tags.toString();
    data['tracking_url'] = trackingUrl;
    if (dataTransaction != null) {
      data['dataTransaction'] = dataTransaction!.toJson();
    }
    data['vouchers'] = vouchers.toString();
    data['conditions_md'] = conditionsMd;
    data['origin_name'] = originName;
    return data;
  }
}

Transaction transaction(String str) => Transaction.fromJson(json.decode(str));

String transactionToJson(Map<String, dynamic> data) => json.encode(transactionToDataBase(data));

Map<String, dynamic> transactionToDataBase(data) => {
      "count": data['count'],
      "value": data['value'],
    };

class Transaction {
  int? count;
  var value;

  Transaction({this.count, this.value});

  Transaction.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['value'] = value;
    return data;
  }
}
