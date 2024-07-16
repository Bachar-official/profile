class Experience {
  final String companyName;
  final DateTime from;
  final DateTime? to;
  final String position;
  final String description;

  const Experience({
    required this.companyName,
    required this.from,
    required this.position,
    required this.description,
    this.to,
  });

  factory Experience.fromLocalization(String localizedString) {
    final list = localizedString.split(':');

    return Experience(
      companyName: list[0],
      position: list[1],
      description: list[2],
      from: DateTime.parse(list[3]),
      to: list.length > 4 ? DateTime.parse(list[4]) : null,
    );
  }
}