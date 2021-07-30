// To parse this JSON data, do
//
//     final dropdownWeaponsModel = dropdownWeaponsModelFromMap(jsonString);

import 'dart:convert';

List<DropdownWeaponsModel> dropdownWeaponsModelFromMap(String str) =>
    List<DropdownWeaponsModel>.from(
        json.decode(str).map((x) => DropdownWeaponsModel.fromMap(x)));

class DropdownWeaponsModel {
  DropdownWeaponsModel({
    this.key,
    this.value,
  });

  String key;
  String value;

  DropdownWeaponsModel copyWith({
    String key,
    String value,
  }) =>
      DropdownWeaponsModel(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory DropdownWeaponsModel.fromMap(Map<String, dynamic> json) =>
      DropdownWeaponsModel(
        key: json["key"] == null ? "" : json["key"],
        value: json["value"] == null ? "" : json["value"],
      );
}
