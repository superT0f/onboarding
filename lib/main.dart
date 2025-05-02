
import 'package:flutter/material.dart';

import 'onboarding_widget.dart';

// TODO : replace this with your real endpoint URL
String mockDataURL =
    "https://tof.prigent.site/onboarding/cprigent.json";

void main() {
  runApp(const Onboarding());
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'onboarding assistant',
      home: OnboardingWidget(),
    );
  }
}

