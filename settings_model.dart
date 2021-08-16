// To parse this JSON data, do
//
//     final dropdownModel = dropdownModelFromMap(jsonString);

import 'dart:convert';

List<SettingsModel> settingsModelFromMap(String str) =>
    List<SettingsModel>.from(
        json.decode(str).map((x) => SettingsModel.fromMap(x)));

class SettingsModel {
  SettingsModel({
    this.value,
    this.type,
  });

  String value;
  String type;

  SettingsModel copyWith({
    String value,
    String type,
  }) =>
      SettingsModel(
        value: value ?? this.value,
        type: type ?? this.type,
      );

  factory SettingsModel.fromMap(Map<String, dynamic> json) => SettingsModel(
        value: json["value"] == null ? "" : json["value"],
        type: json["type"] == null ? "" : json["type"],
      );
}
