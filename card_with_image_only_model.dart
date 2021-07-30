import 'dart:convert';

List<CardWithImageOnlyModel> cardWithImageOnlyFromMap(String str) =>
    List<CardWithImageOnlyModel>.from(
        json.decode(str).map((x) => CardWithImageOnlyModel.fromMap(x)));

class CardWithImageOnlyModel {
  CardWithImageOnlyModel({
    this.key,
    this.src,
  });

  String key;
  String src;

  CardWithImageOnlyModel copyWith({
    String key,
    String src,
  }) =>
      CardWithImageOnlyModel(
        key: key ?? this.key,
        src: src ?? this.src,
      );

  factory CardWithImageOnlyModel.fromMap(Map<String, dynamic> json) =>
      CardWithImageOnlyModel(
        key: json["key"] == null ? "" : json["key"],
        src: json["src"] == null ? "" : json["src"],
      );
}
