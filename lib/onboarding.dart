import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Center(
                child: Text(
                  "1",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Center(
                child: Text(
                  "2",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SmoothPageIndicator(
                controller: _controller, // PageController
                count: 2,
                effect: WormEffect(
                  spacing: 20,
                  dotColor: Colors.grey.shade300,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                ), // your preferred effect
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
