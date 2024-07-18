class Project {
  final String name;
  final String description;
  final String url;

  const Project(
      {required this.name, required this.description, required this.url});

  factory Project.fromLocale(String locale) {
    final parts = locale.split(';');

    return Project(
      name: parts[0],
      description: parts[2],
      url: parts[1],
    );
  }
}
