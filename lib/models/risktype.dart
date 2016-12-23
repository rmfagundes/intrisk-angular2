class RiskType {
  final int id;
  String name;
  String language;

  RiskType(this.id, this.name, this.language);

  factory RiskType.fromJson(Map<String, dynamic> rType) =>
    new RiskType(rType['id'] != null ? _toInt(rType['id']) : null,
                 rType['name'],
                 rType['language']);

  Map toJson() => {'id': id, 'name': name, 'language': language};
}

int _toInt(id) => id is int ? id : int.parse(id);
