class ShortToKillListModel {
  final List<String> columns;
  final List<ShortToKillModel> data;
  ShortToKillListModel({this.columns, this.data});
}

class ShortToKillModel {
  final String src;
  final String name;
  final String value;
  ShortToKillModel({this.src, this.name, this.value});
}
