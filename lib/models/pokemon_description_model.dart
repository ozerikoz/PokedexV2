class PokemonDescriptionModel {
  late final String xdescription;
  late final String ydescription;

  PokemonDescriptionModel(
      {required this.xdescription, required this.ydescription});

  PokemonDescriptionModel.fromJson(Map<String, dynamic> json) {
    xdescription = json['xdescription'];
    ydescription = json['ydescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['xdescription'] = xdescription;
    data['ydescription'] = ydescription;
    return data;
  }
}
