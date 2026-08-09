import 'package:flutter/material.dart';

import 'onboarding2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("data"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Onboarding2();
                    },
                  ),
                );
              },
              child: Text("Weiter"),
            ),
          ],
        ),
      ),
    );
  }
}
