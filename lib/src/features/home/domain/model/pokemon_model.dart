import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonModel {
  final String name;
  final String url;
  PokemonModel._({
    required this.name,
    required this.url,
  });

  factory PokemonModel.instance(
    String name,
    String url
  ) => PokemonModel._(
    name: name,
    url: url,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel._(
      name: map['name'] as String,
      url: map['img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) => PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PokemonModel copyWith({
    String? name,
    String? url,
  }) => PokemonModel._(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  
}

