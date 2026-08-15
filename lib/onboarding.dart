import 'package:flutter/material.dart';
import 'package:flutterneu/onboarding1.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  _OnboardingPagesState createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Onboarding1());
  }
}
