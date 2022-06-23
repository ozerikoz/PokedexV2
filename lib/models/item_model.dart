class ItemModel {
  late final String name;
  late final int cost;
  late final String effect;
  late final String image;
  late final int id;

  ItemModel({
    required this.name,
    required this.cost,
    required this.effect,
    required this.image,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    cost = json['cost'];
    effect = json["effect_entries"][0]["effect"];
    image = json['sprites']['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data["id"] = id;
    data['cost'] = cost;
    data["effect"][0] = effect;
    data['sprites']['default'] = image;
    return data;
  }
}
