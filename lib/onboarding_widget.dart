
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboarding/onboarding_task_list_widget.dart';
import 'package:onboarding/onboarding_step.dart';
import 'package:flutter/foundation.dart';

import 'main.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});
  final String title = 'Welcome! Your onboarding progress updates live.';

  @override
  State<OnboardingWidget> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingWidget> {
  List<OnboardingStep> onboardingSteps = List.empty();

  void _loadData() {
    // String jsonData = "";
    if (onboardingSteps.isEmpty){
    downloadJson(mockDataURL).then((jsonData) {
      setState(() {
        List<dynamic> jsonResponse = json.decode(jsonData);
        onboardingSteps = jsonResponse
          .map((e) => OnboardingStep.fromJson(e as Map<String, dynamic>))
          .toList();
      });  
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      debugPrint("load data");
    }
    _loadData();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 31.0)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OnboardingTaskListWidget(onboardingSteps: onboardingSteps,),
          ],
        ),
      ),
    );
  }
}

Future<String> downloadJson(String url) async {
  try {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // if (kDebugMode){
      //   debugPrint(response.body);
      // }
      

      return response.body;
    } else {
      throw Exception(
          'Failed to load JSON data from the internet. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error downloading JSON: $e');
  }
}
