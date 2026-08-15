import 'package:flutter/material.dart';
import 'package:flutterneu/onboarding_auswahl.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double
              .infinity, // Stellt sicher, dass die Column die volle Bildschirmbreite nutzt
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    Text(
                      "Skip",
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight:
                            FontWeight.w400, // oder z. B. FontWeight.w600
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  "Select the foods you don't eat",
                  textAlign: TextAlign.center,
                  style: textTheme.displayMedium,
                ),
                SizedBox(height: 20),
                Text(
                  "This will help us customize the recipe feed to your preferences",
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400, // oder z. B. FontWeight.w600
                  ),
                ),
                Auswahl(),
                OnboardingButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text("Weiter"));
  }
}
