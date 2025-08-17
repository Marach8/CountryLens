class Country {
  Country({
    this.name,
    this.emoji,
    this.capital,
    this.continent,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      emoji: json['emoji'],
      capital: json['capital'],
      continent: json['continent']['name'],
    );
  }

  final String? name, emoji, capital, continent;
}
