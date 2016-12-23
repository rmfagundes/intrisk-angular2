class RiskType {
  String id;
  String name;
  String language;

  RiskType(this.id, this.name, this.language);

  factory RiskType.fromJson(Map<String, dynamic> rType) =>
    new RiskType(rType['id'], rType['name'], rType['language']);

  Map toJson() => {'id': id, 'name': name, 'language': language};
}
