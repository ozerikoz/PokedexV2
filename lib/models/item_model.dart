class ItemModel {
  late final String name;
  late final int cost;
  late final String effect;
  late final String image;

  ItemModel({
    required this.name,
    required this.cost,
    required this.effect,
    required this.image,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = json['cost'];
    effect = json["effect"][0];
    image = json['sprites']['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cost'] = cost;
    data["effect"][0] = effect;
    data['sprites']['default'] = image;
    return data;
  }
}
