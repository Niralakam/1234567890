// To parse this JSON data, do
//
//     final cardVerticalContentWidgetModel = cardVerticalContentWidgetModelFromMap(jsonString);

import 'dart:convert';

List<CardVerticalContentWidgetModel> cardVerticalContentWidgetModelFromMap(
        String str) =>
    List<CardVerticalContentWidgetModel>.from(
        json.decode(str).map((x) => CardVerticalContentWidgetModel.fromMap(x)));

class CardVerticalContentWidgetModel {
  CardVerticalContentWidgetModel({
    this.map,
    this.title,
    this.key,
    this.value,
    this.topContent,
    this.bottomContent,
  });

  String map;
  String title;
  String key;
  String value;
  List<Content> topContent;
  List<Content> bottomContent;

  CardVerticalContentWidgetModel copyWith({
    String map,
    String title,
    String key,
    String value,
    List<Content> topContent,
    List<Content> bottomContent,
  }) =>
      CardVerticalContentWidgetModel(
        map: map ?? this.map,
        title: title ?? this.title,
        key: key ?? this.key,
        value: value ?? this.value,
        topContent: topContent ?? this.topContent,
        bottomContent: bottomContent ?? this.bottomContent,
      );

  factory CardVerticalContentWidgetModel.fromMap(Map<String, dynamic> json) =>
      CardVerticalContentWidgetModel(
        map: json["map"] == null ? "" : json["map"],
        title: json["title"] == null ? "" : json["title"],
        key: json["key"] == null ? "" : json["key"],
        value: json["value"] == null ? "" : json["value"],
        topContent: json["topContent"] == null
            ? []
            : List<Content>.from(
                json["topContent"].map((x) => Content.fromMap(x))),
        bottomContent: json["bottomContent"] == null
            ? []
            : List<Content>.from(
                json["bottomContent"].map((x) => Content.fromMap(x))),
      );
}

class Content {
  Content({
    this.key,
    this.value,
  });

  String key;
  String value;

  Content copyWith({
    String key,
    String value,
  }) =>
      Content(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        key: json["key"] == null ? "" : json["key"],
        value: json["value"] == null ? "" : json["value"],
      );
}
