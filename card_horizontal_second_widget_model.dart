import 'dart:convert';

List<CardHorizontalSecondWidgetModel> cardHorizontalSecondWidgetModelFromMap(
        String str) =>
    List<CardHorizontalSecondWidgetModel>.from(json
        .decode(str)
        .map((x) => CardHorizontalSecondWidgetModel.fromMap(x)));

String cardHorizontalSecondWidgetModelToMap(
        List<CardHorizontalSecondWidgetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CardHorizontalSecondWidgetModel {
  CardHorizontalSecondWidgetModel({
    this.title,
    this.details,
  });

  String title;
  List<CardHorizontalSecondWidgetModelDetail> details;

  CardHorizontalSecondWidgetModel copyWith({
    String title,
    List<CardHorizontalSecondWidgetModelDetail> details,
  }) =>
      CardHorizontalSecondWidgetModel(
        title: title ?? this.title,
        details: details ?? this.details,
      );

  factory CardHorizontalSecondWidgetModel.fromMap(Map<String, dynamic> json) =>
      CardHorizontalSecondWidgetModel(
        title: json["title"] == null ? "" : json["title"],
        details: json["details"] == null
            ? []
            : List<CardHorizontalSecondWidgetModelDetail>.from(json["details"]
                .map((x) => CardHorizontalSecondWidgetModelDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? "" : title,
        "details": details == null
            ? ""
            : List<dynamic>.from(details.map((x) => x.toMap())),
      };
}

class CardHorizontalSecondWidgetModelDetail {
  CardHorizontalSecondWidgetModelDetail({
    this.key,
    this.value,
    this.details,
  });

  String key;
  String value;
  List<DetailDetail> details;

  CardHorizontalSecondWidgetModelDetail copyWith({
    String key,
    String value,
    List<DetailDetail> details,
  }) =>
      CardHorizontalSecondWidgetModelDetail(
        key: key ?? this.key,
        value: value ?? this.value,
        details: details ?? this.details,
      );

  factory CardHorizontalSecondWidgetModelDetail.fromMap(
          Map<String, dynamic> json) =>
      CardHorizontalSecondWidgetModelDetail(
        key: json["key"] == null ? "" : json["key"],
        value: json["value"] == null ? "" : json["value"],
        details: json["details"] == null
            ? []
            : List<DetailDetail>.from(
                json["details"].map((x) => DetailDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "key": key == null ? "" : key,
        "value": value == null ? "" : value,
        "details": details == null
            ? []
            : List<dynamic>.from(details.map((x) => x.toMap())),
      };
}

class DetailDetail {
  DetailDetail({
    this.key,
    this.value,
  });

  String key;
  int value;

  DetailDetail copyWith({
    String key,
    int value,
  }) =>
      DetailDetail(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory DetailDetail.fromMap(Map<String, dynamic> json) => DetailDetail(
        key: json["key"] == null ? "" : json["key"],
        value: json["value"] == null ? 0 : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "key": key == null ? "" : key,
        "src": value == null ? "" : value,
      };
}
