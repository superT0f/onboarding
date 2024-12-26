

class OnboardingStep {
  final String title;
  final String status;
  final String? description;
  final List<Subtask>? subtasks;

  OnboardingStep({
    required this.title,
    required this.status,
    this.description,
    this.subtasks,
  });

  factory OnboardingStep.fromJson(Map<String, dynamic> json) {
    return OnboardingStep(
      title: json['title'] as String,
      status: json['status'] as String,
      description: json['description'] as String?,
      subtasks: (json['subtasks'] as List?)
          ?.map((e) => Subtask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Subtask {
  final String title;
  final String status;
  final String? alert;

  Subtask({
    required this.title,
    required this.status,
    this.alert,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      title: json['title'] as String,
      status: json['status'] as String,
      alert: json['alert'] as String?,
    );
  }
}
