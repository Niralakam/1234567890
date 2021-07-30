// To parse this JSON data, do
//
//     final cardHorizontalFirstWithSubWidgetModel = cardHorizontalFirstWithSubWidgetModelFromMap(jsonString);

import 'dart:convert';

List<CardHorizontalFirstWithSubWidgetModel>
    cardHorizontalFirstWithSubWidgetModelFromMap(String str) =>
        List<CardHorizontalFirstWithSubWidgetModel>.from(json
            .decode(str)
            .map((x) => CardHorizontalFirstWithSubWidgetModel.fromMap(x)));

class CardHorizontalFirstWithSubWidgetModel {
  CardHorizontalFirstWithSubWidgetModel({
    this.title,
    this.details,
  });

  String title;
  List<Detail> details;

  CardHorizontalFirstWithSubWidgetModel copyWith({
    String title,
    List<Detail> details,
  }) =>
      CardHorizontalFirstWithSubWidgetModel(
        title: title ?? this.title,
        details: details ?? this.details,
      );

  factory CardHorizontalFirstWithSubWidgetModel.fromMap(
          Map<String, dynamic> json) =>
      CardHorizontalFirstWithSubWidgetModel(
        title: json["title"] == null ? "" : json["title"],
        details: json["details"] == null
            ? []
            : List<Detail>.from(json["details"].map((x) => Detail.fromMap(x))),
      );
}

class Detail {
  Detail({
    this.range,
    this.info,
    this.head,
    this.vest,
    this.key,
    this.src,
    this.value,
    this.attachements,
  });

  List<Head> range;
  List<Head> info;
  List<Head> head;
  List<Head> vest;
  String key;
  String src;
  String value;
  List<Attachement> attachements;

  Detail copyWith({
    List<Head> range,
    List<Head> info,
    List<Head> head,
    List<Head> vest,
    String key,
    String src,
    List<Attachement> attachements,
  }) =>
      Detail(
        range: range ?? this.range,
        info: info ?? this.info,
        head: head ?? this.head,
        vest: vest ?? this.vest,
        key: key ?? this.key,
        src: src ?? this.src,
        value: value ?? this.value,
        attachements: attachements ?? this.attachements,
      );

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
        range: json["range"] == null
            ? []
            : List<Head>.from(json["range"].map((x) => Head.fromMap(x))),
        info: json["info"] == null
            ? []
            : List<Head>.from(json["info"].map((x) => Head.fromMap(x))),
        head: json["head"] == null
            ? []
            : List<Head>.from(json["head"].map((x) => Head.fromMap(x))),
        vest: json["vest"] == null
            ? []
            : List<Head>.from(json["vest"].map((x) => Head.fromMap(x))),
        key: json["key"] == null ? "" : json["key"],
        src: json["src"] == null ? "" : json["src"],
        value: json["value"] == null ? "" : json["value"],
        attachements: json["attachements"] == null
            ? []
            : List<Attachement>.from(
                json["attachements"].map((x) => Attachement.fromMap(x))),
      );
}

class Attachement {
  Attachement({
    this.key,
    this.value,
    this.src,
  });

  String key;
  String value;
  String src;

  Attachement copyWith({
    String key,
    String value,
    String src,
  }) =>
      Attachement(
        key: key ?? this.key,
        value: value ?? this.value,
        src: src ?? this.src,
      );

  factory Attachement.fromMap(Map<String, dynamic> json) => Attachement(
        key: json["key"] == null ? "" : json["key"],
        value: json["value"] == null ? "" : json["value"],
        src: json["src"] == null ? "" : json["src"],
      );
}

class Head {
  Head({
    this.key,
    this.value,
  });

  String key;
  String value;

  Head copyWith({
    String key,
    String value,
  }) =>
      Head(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory Head.fromMap(Map<String, dynamic> json) => Head(
        key: json["key"] == null ? "" : json["key"],
        value: json["value"] == null ? "" : json["value"],
      );
}
