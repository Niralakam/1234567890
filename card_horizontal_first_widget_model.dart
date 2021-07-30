import 'dart:convert';

List<CardHorizontalFirstWidgetModel> cardHorizontalFirstWidgetModelFromMap(
        String str) =>
    List<CardHorizontalFirstWidgetModel>.from(
        json.decode(str).map((x) => CardHorizontalFirstWidgetModel.fromMap(x)));

class CardHorizontalFirstWidgetModel {
  CardHorizontalFirstWidgetModel({
    this.title,
    this.details,
  });

  String title;
  List<CardHorizontalFirstWidgetModelDetail> details;

  CardHorizontalFirstWidgetModel copyWith({
    String title,
    List<CardHorizontalFirstWidgetModelDetail> details,
  }) =>
      CardHorizontalFirstWidgetModel(
        title: title ?? this.title,
        details: details ?? this.details,
      );

  factory CardHorizontalFirstWidgetModel.fromMap(Map<String, dynamic> json) =>
      CardHorizontalFirstWidgetModel(
        title: json["title"] == null ? "" : json["title"],
        details: json["details"] == null
            ? []
            : List<CardHorizontalFirstWidgetModelDetail>.from(json["details"]
                .map((x) => CardHorizontalFirstWidgetModelDetail.fromMap(x))),
      );
}

class CardHorizontalFirstWidgetModelDetail {
  CardHorizontalFirstWidgetModelDetail({
    this.key,
    this.src,
    this.details,
  });

  String key;
  String src;
  List<DetailDetail> details;

  CardHorizontalFirstWidgetModelDetail copyWith({
    String key,
    String src,
    List<DetailDetail> details,
  }) =>
      CardHorizontalFirstWidgetModelDetail(
        key: key ?? this.key,
        src: src ?? this.src,
        details: details ?? this.details,
      );

  factory CardHorizontalFirstWidgetModelDetail.fromMap(
          Map<String, dynamic> json) =>
      CardHorizontalFirstWidgetModelDetail(
        key: json["key"] == null ? "" : json["key"],
        src: json["src"] == null ? "" : json["src"],
        details: json["details"] == null
            ? null
            : List<DetailDetail>.from(
                json["details"].map((x) => DetailDetail.fromMap(x))),
      );
}

class DetailDetail {
  DetailDetail({
    this.key,
    this.value,
  });

  String key;
  String value;

  DetailDetail copyWith({
    String key,
    String value,
  }) =>
      DetailDetail(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory DetailDetail.fromMap(Map<String, dynamic> json) => DetailDetail(
        key: json["key"] == null ? "" : json["key"],
        value: json["value"] == null ? "" : json["value"],
      );
}
