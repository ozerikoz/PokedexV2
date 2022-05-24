class PokemonSpecieModel {
  PokemonSpecieModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });
  late final int baseHappiness;
  late final int captureRate;
  late final Color color;
  late final List<EggGroups> eggGroups;
  late final EvolutionChain evolutionChain;
  late final Null evolvesFromSpecies;
  late final List<FlavorTextEntries> flavorTextEntries;
  late final List<dynamic> formDescriptions;
  late final bool formsSwitchable;
  late final int genderRate;
  late final List<Genera> genera;
  late final Generation generation;
  late final GrowthRate growthRate;
  late final Habitat habitat;
  late final bool hasGenderDifferences;
  late final int hatchCounter;
  late final int id;
  late final bool isBaby;
  late final bool isLegendary;
  late final bool isMythical;
  late final String name;
  late final List<Names> names;
  late final int order;
  late final List<PalParkEncounters> palParkEncounters;
  late final List<PokedexNumbers> pokedexNumbers;
  late final Shape shape;
  late final List<Varieties> varieties;

  PokemonSpecieModel.fromJson(Map<String, dynamic> json) {
    baseHappiness = json['base_happiness'];
    captureRate = json['capture_rate'];
    color = Color.fromJson(json['color']);
    eggGroups = List.from(json['egg_groups'])
        .map((e) => EggGroups.fromJson(e))
        .toList();
    evolutionChain = EvolutionChain.fromJson(json['evolution_chain']);
    evolvesFromSpecies = null;
    flavorTextEntries = List.from(json['flavor_text_entries'])
        .map((e) => FlavorTextEntries.fromJson(e))
        .toList();
    formDescriptions =
        List.castFrom<dynamic, dynamic>(json['form_descriptions']);
    formsSwitchable = json['forms_switchable'];
    genderRate = json['gender_rate'];
    genera = List.from(json['genera']).map((e) => Genera.fromJson(e)).toList();
    generation = Generation.fromJson(json['generation']);
    growthRate = GrowthRate.fromJson(json['growth_rate']);
    json['habitat'] != null
        ? habitat = Habitat.fromJson(json['habitat'])
        : null;
    hasGenderDifferences = json['has_gender_differences'];
    hatchCounter = json['hatch_counter'];
    id = json['id'];
    isBaby = json['is_baby'];
    isLegendary = json['is_legendary'];
    isMythical = json['is_mythical'];
    name = json['name'];
    names = List.from(json['names']).map((e) => Names.fromJson(e)).toList();
    order = json['order'];
    palParkEncounters = List.from(json['pal_park_encounters'])
        .map((e) => PalParkEncounters.fromJson(e))
        .toList();
    pokedexNumbers = List.from(json['pokedex_numbers'])
        .map((e) => PokedexNumbers.fromJson(e))
        .toList();
    json["shape"] != null ? shape = Shape.fromJson(json['shape']) : null;
    varieties =
        List.from(json['varieties']).map((e) => Varieties.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['base_happiness'] = baseHappiness;
    _data['capture_rate'] = captureRate;
    _data['color'] = color.toJson();
    _data['egg_groups'] = eggGroups.map((e) => e.toJson()).toList();
    _data['evolution_chain'] = evolutionChain.toJson();
    _data['evolves_from_species'] = evolvesFromSpecies;
    _data['flavor_text_entries'] =
        flavorTextEntries.map((e) => e.toJson()).toList();
    _data['form_descriptions'] = formDescriptions;
    _data['forms_switchable'] = formsSwitchable;
    _data['gender_rate'] = genderRate;
    _data['genera'] = genera.map((e) => e.toJson()).toList();
    _data['generation'] = generation.toJson();
    _data['growth_rate'] = growthRate.toJson();
    _data['habitat'] = habitat.toJson();
    _data['has_gender_differences'] = hasGenderDifferences;
    _data['hatch_counter'] = hatchCounter;
    _data['id'] = id;
    _data['is_baby'] = isBaby;
    _data['is_legendary'] = isLegendary;
    _data['is_mythical'] = isMythical;
    _data['name'] = name;
    _data['names'] = names.map((e) => e.toJson()).toList();
    _data['order'] = order;
    _data['pal_park_encounters'] =
        palParkEncounters.map((e) => e.toJson()).toList();
    _data['pokedex_numbers'] = pokedexNumbers.map((e) => e.toJson()).toList();
    _data['shape'] = shape.toJson();
    _data['varieties'] = varieties.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Color {
  Color({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Color.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class EggGroups {
  EggGroups({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  EggGroups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });
  late final String url;

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
  }
}

class FlavorTextEntries {
  FlavorTextEntries({
    required this.flavorText,
    required this.language,
    required this.version,
  });
  late final String flavorText;
  late final Language language;
  late final Version version;

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = Language.fromJson(json['language']);
    version = Version.fromJson(json['version']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['flavor_text'] = flavorText;
    _data['language'] = language.toJson();
    _data['version'] = version.toJson();
    return _data;
  }
}

class Language {
  Language({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Version {
  Version({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Version.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Genera {
  Genera({
    required this.genus,
    required this.language,
  });
  late final String genus;
  late final Language language;

  Genera.fromJson(Map<String, dynamic> json) {
    genus = json['genus'];
    language = Language.fromJson(json['language']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['genus'] = genus;
    _data['language'] = language.toJson();
    return _data;
  }
}

class Generation {
  Generation({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Generation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class GrowthRate {
  GrowthRate({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  GrowthRate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Habitat {
  Habitat({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Habitat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Names {
  Names({
    required this.language,
    required this.name,
  });
  late final Language language;
  late final String name;

  Names.fromJson(Map<String, dynamic> json) {
    language = Language.fromJson(json['language']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['language'] = language.toJson();
    _data['name'] = name;
    return _data;
  }
}

class PalParkEncounters {
  PalParkEncounters({
    required this.area,
    required this.baseScore,
    required this.rate,
  });
  late final Area area;
  late final int baseScore;
  late final int rate;

  PalParkEncounters.fromJson(Map<String, dynamic> json) {
    area = Area.fromJson(json['area']);
    baseScore = json['base_score'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['area'] = area.toJson();
    _data['base_score'] = baseScore;
    _data['rate'] = rate;
    return _data;
  }
}

class Area {
  Area({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Area.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class PokedexNumbers {
  PokedexNumbers({
    required this.entryNumber,
    required this.pokedex,
  });
  late final int entryNumber;
  late final Pokedex pokedex;

  PokedexNumbers.fromJson(Map<String, dynamic> json) {
    entryNumber = json['entry_number'];
    pokedex = Pokedex.fromJson(json['pokedex']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['entry_number'] = entryNumber;
    _data['pokedex'] = pokedex.toJson();
    return _data;
  }
}

class Pokedex {
  Pokedex({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Pokedex.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Shape {
  Shape({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Shape.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Varieties {
  Varieties({
    required this.isDefault,
    required this.pokemon,
  });
  late final bool isDefault;
  late final Pokemon pokemon;

  Varieties.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    pokemon = Pokemon.fromJson(json['pokemon']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['is_default'] = isDefault;
    _data['pokemon'] = pokemon.toJson();
    return _data;
  }
}

class Pokemon {
  Pokemon({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}
