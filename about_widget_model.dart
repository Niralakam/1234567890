// To parse this JSON data, do
//
//     final aboutWidgetModel = aboutWidgetModelFromMap(jsonString);

import 'dart:convert';

List<AboutWidgetModel> aboutWidgetModelFromMap(String str) =>
    List<AboutWidgetModel>.from(
        json.decode(str).map((x) => AboutWidgetModel.fromMap(x)));

class AboutWidgetModel {
  AboutWidgetModel({
    this.title,
    this.details,
  });

  String title;
  List<Detail> details;

  AboutWidgetModel copyWith({
    String title,
    List<Detail> details,
  }) =>
      AboutWidgetModel(
        title: title ?? this.title,
        details: details ?? this.details,
      );

  factory AboutWidgetModel.fromMap(Map<String, dynamic> json) =>
      AboutWidgetModel(
        title: json["title"] == null ? "" : json["title"],
        details: json["details"] == null
            ? []
            : List<Detail>.from(json["details"].map((x) => Detail.fromMap(x))),
      );
}

class Detail {
  Detail({
    this.value,
  });

  String value;

  Detail copyWith({
    String value,
  }) =>
      Detail(
        value: value ?? this.value,
      );

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
        value: json["value"] == null ? "" : json["value"],
      );
}
