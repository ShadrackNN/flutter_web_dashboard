class DataModel {
  final int id;
  final String name;
  final int value;

  DataModel({required this.id, required this.name, required this.value});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }
}
