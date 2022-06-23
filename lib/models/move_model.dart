class MoveModel {
  late final int? accuracy;
  late final int? power;
  late final int? pp;
  late final String? name;
  late final String? type;
  late final String? effect;
  late final int? id;

  MoveModel({
    required this.accuracy,
    required this.power,
    required this.pp,
    required this.name,
    required this.type,
    required this.effect,
  });

  MoveModel.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];
    id = json['id'];
    power = json['power'];
    pp = json["pp"];
    name = json['name'];
    type = json["type"]['name'];
    effect = json['effect_entries'][0]['effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accuracy'] = accuracy;
    data["id"] = id;
    data['power'] = power;
    data["pp"] = pp;
    data['name'] = name;
    data['type']['name'] = type;
    data['effect_entries'][0]['effect'] = effect;
    return data;
  }
}
