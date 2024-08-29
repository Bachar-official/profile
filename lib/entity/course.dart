class Course {
  final String name;
  final String company;
  final DateTime endedAt;

  const Course(
      {required this.name, required this.company, required this.endedAt});

  factory Course.fromLocale(String localeString) {
    var list = localeString.split(';');
    return Course(
      name: list[0],
      company: list[1],
      endedAt: DateTime.parse(list[2]),
    );
  }
}
