
import 'package:flutter/material.dart';

import 'onboarding_widget.dart';

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

