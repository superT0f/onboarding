import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String status;
  final String? description;
  final bool isSubTask;
  const TaskWidget(
      {super.key,
      required this.title,
      required this.status,
      required this.description,
      this.isSubTask = false});

  @override
  Widget build(BuildContext context) {
    String statusDone = "✅";
    String statusNotStarted = "💤";
    String statusInProgress = "🏃";
String emoji =  switch(status) {
  "complete" => statusDone,
  "in progress" => statusInProgress,
  "not started" => statusNotStarted,
  _ => "❔"
};
    String spacer = (isSubTask) ? "      - " : "";
    TextStyle descStyle = (isSubTask)
        ? const TextStyle(
            decoration  : TextDecoration.underline,
            color       : Colors.red,
            fontWeight  : FontWeight.bold)
        : const TextStyle();
    return Row(
      children: [
        Text(spacer),
        Text(emoji),
        Text('[$status]'),
        Text(
          title,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
        Text(
          description!,
          style: descStyle,
        ),
      ]
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(left: 5),
              child: e,
            ),
          )
          .toList(),
    );
  }
}
