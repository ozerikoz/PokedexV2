class PokemonSummary {
  late String number;
  late String name;
  late String imageUrl;
  late String thumbnailUrl;
  late List<String> types;
  late String specie;

  PokemonSummary({
    required this.number,
    required this.name,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.types,
    required this.specie,
  });

  PokemonSummary.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    thumbnailUrl = json['thumbnailUrl'];
    types = json['types'].cast<String>();
    specie = json['specie'];
  }
}
