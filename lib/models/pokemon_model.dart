class Pokemon {
  Pokemon({
    // this.id = "id",
    this.url = "pokeUrl",
    this.name = "pokename",
    // this.abilities = const [],
    // this.height = "height",
    // this.stats = const [],
    // this.defaultImage = "defaultImage",
  });

  factory Pokemon.fromJson(dynamic json) {
    return Pokemon(
      // id: json["results"][0]['id'],
      url: json['url'],
      name: json['name'],
    );
    // abilities: json["results"][0]['abilities'],
    // height: json["results"][0]['height'],
    // stats: json["results"][0]['stats'],
    // defaultImage: json["results"][0]['sprites']['back_default']);
  }

  // final String id;
  late final String url;
  final String name;
  // final List<dynamic> abilities;
  // final String height;
  // final List<dynamic> stats;
  // final String defaultImage;
}

class PokemonList {
  List result;

  PokemonList({required this.result});

  factory PokemonList.fromJson(dynamic json) {
    return PokemonList(
      result: json["results"],
    );
  }
}
