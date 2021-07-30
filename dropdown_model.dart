// To parse this JSON data, do
//
//     final dropdownModel = dropdownModelFromMap(jsonString);

import 'dart:convert';

List<DropdownModel> dropdownModelFromMap(String str) =>
    List<DropdownModel>.from(
        json.decode(str).map((x) => DropdownModel.fromMap(x)));

class DropdownModel {
  DropdownModel({
    this.key,
    this.name,
  });

  String key;
  String name;

  DropdownModel copyWith({
    String key,
    String name,
  }) =>
      DropdownModel(
        key: key ?? this.key,
        name: name ?? this.name,
      );

  factory DropdownModel.fromMap(Map<String, dynamic> json) => DropdownModel(
        key: json["key"] == null ? "" : json["key"],
        name: json["name"] == null ? "" : json["name"],
      );
}
