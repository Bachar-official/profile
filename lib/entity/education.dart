class Education {
  final String institutionName;
  final String qualification;
  final String specialization;
  final DateTime gradeDate;

  Education({
    required this.institutionName,
    required this.qualification,
    required this.specialization,
    required this.gradeDate,
  });

  factory Education.fromLocale(String locale) {
    final list = locale.split(':');
    return Education(
      institutionName: list[0],
      qualification: list[1],
      specialization: list[2],
      gradeDate: DateTime.parse(list[3]),
    );
  }
}