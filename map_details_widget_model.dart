import 'dart:convert';

List<MapDetailsWidgetModel> mapDetailsWidgetModelFromMap(String str) =>
    List<MapDetailsWidgetModel>.from(
        json.decode(str).map((x) => MapDetailsWidgetModel.fromMap(x)));

class MapDetailsWidgetModel {
  MapDetailsWidgetModel({
    this.name,
    this.maps,
    this.details,
  });

  String name;
  List<MapElement> maps;
  List<Detail> details;

  MapDetailsWidgetModel copyWith({
    String name,
    List<MapElement> maps,
    List<Detail> details,
  }) =>
      MapDetailsWidgetModel(
        name: name ?? this.name,
        maps: maps ?? this.maps,
        details: details ?? this.details,
      );

  factory MapDetailsWidgetModel.fromMap(Map<String, dynamic> json) =>
      MapDetailsWidgetModel(
        name: json["name"] == null ? "" : json["name"],
        maps: json["maps"] == null
            ? []
            : List<MapElement>.from(
                json["maps"].map((x) => MapElement.fromMap(x))),
        details: json["details"] == null
            ? []
            : List<Detail>.from(json["details"].map((x) => Detail.fromMap(x))),
      );
}

class Detail {
  Detail({
    this.title,
    this.contents,
  });

  String title;
  List<Content> contents;

  Detail copyWith({
    String title,
    List<Content> contents,
  }) =>
      Detail(
        title: title ?? this.title,
        contents: contents ?? this.contents,
      );

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
        title: json["title"] == null ? "" : json["title"],
        contents: json["contents"] == null
            ? []
            : List<Content>.from(
                json["contents"].map((x) => Content.fromMap(x))),
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

class MapElement {
  MapElement({
    this.key,
    this.value,
  });

  String key;
  String value;

  MapElement copyWith({
    String key,
    String value,
  }) =>
      MapElement(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory MapElement.fromMap(Map<String, dynamic> json) => MapElement(
        key: json["key"] == null ? "" : json["key"],
        value: json["value"] == null ? "" : json["value"],
      );
}
