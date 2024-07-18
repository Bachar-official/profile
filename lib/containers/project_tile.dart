import 'package:flutter/material.dart';
import 'package:profile/entity/index.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectTile extends StatelessWidget {
  final String localeString;
  const ProjectTile({super.key, required this.localeString});

  @override
  Widget build(BuildContext context) {
    final Project project = Project.fromLocale(localeString);
    return ListTile(
      title: Text('${project.name} - ${project.description}'),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () async => await launchUrlString(project.url),
            child: Text(
              project.url,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
