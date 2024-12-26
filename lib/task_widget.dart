import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    Widget emoji = SvgPicture.asset(
      switch (status) {
        "in progress" => './assets/images/wip.svg',
        "complete"    => './assets/images/done.svg',
        "not started" => './assets/images/todo.svg',
        _             => 'assets/images/question.svg',
      },
      width: 35.0,
    );
    String spacer = (isSubTask) ? "      ↳  " : "";
    TextStyle descStyle = (isSubTask)
        ? const TextStyle(
            decoration  : TextDecoration.underline,
            color       : Colors.red,
            fontWeight  : FontWeight.bold)
        : const TextStyle();
    return Row(
      children: [
        Text(spacer),
        emoji,
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
