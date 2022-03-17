class PokemonSummaryModel {
  late String number;
  late String name;
  late String imageUrl;
  late List<String> types;
  late String specie;

  PokemonSummaryModel({
    required this.number,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.specie,
  });

  PokemonSummaryModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    types = json['types'].cast<String>();
    specie = json['specie'];
  }
}
