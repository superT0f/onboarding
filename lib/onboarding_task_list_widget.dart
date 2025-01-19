
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding_step.dart';
import 'package:onboarding/task_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OnboardingTaskListWidget extends StatelessWidget {
  const OnboardingTaskListWidget({super.key, required this.onboardingSteps});
  final List<OnboardingStep> onboardingSteps;

  @override
  Widget build(BuildContext context) {
    List<StatelessWidget> items = [
       ProgressBar(onboardingSteps:onboardingSteps),
    ];
        for (var step in onboardingSteps) {
            items.add( TaskWidget(title: step.title, status: step.status, description: step.description));
            if (step.subtasks != null) {
              if (kDebugMode){
                debugPrint("subtasks:");
                debugPrint(step.subtasks!.length.toString());
              }
              for (var subtask in step.subtasks!) {
                String description = "";
                if (subtask.alert != null){
                  description = subtask.alert!;
                }
                items.add(TaskWidget(title: subtask.title, status: subtask.status, description: description, isSubTask: true,));
              }
            }
            
        }
        // items.add(       ProgressBar(onboardingSteps:onboardingSteps));
    return Column(
      children: items,
    );
  }
}

class ProgressBar extends StatelessWidget {
  final List<OnboardingStep> onboardingSteps;

  const ProgressBar({super.key, required this.onboardingSteps});

  @override
  Widget build(BuildContext context) {
    var (score, max, percent) = _calculateProgress();
    // return const Row(children:[Text('todo')]);
    return Flex(
      mainAxisSize: MainAxisSize.max,
      direction: Axis.horizontal,
      children:[
        Text('  Overall progress : ${score.toString()} step(s) on $max', style: const TextStyle(fontWeight: FontWeight.bold),),
LinearPercentIndicator(
                animation: true,
                animationDuration: 5500,
                width: 230.0,
                lineHeight: 16.0,
                percent: percent,
                center: Text(
                  '${(percent*100.0).toStringAsFixed(1)}%',
                  style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.mood_sharp),
                // linearStrokeCap: BarRadius.roundAll,
                backgroundColor: Colors.blueGrey,
                progressColor: Colors.greenAccent,
              )
      ]

    );
  }
  
  (int, int, double) _calculateProgress() {
    var score = 0;
    var max = 0;

    for (var step in onboardingSteps) {
      if (step.status == "complete") {
        score++;
      }
      max++;
      // deep in subtask if any
      if (step.subtasks != null) {
        for(var task in step.subtasks!) {
          if (task.status == "complete") {
            score++;
          }
          max++;
        }
      }
    }
    return (score, max, score/max);
  }
}