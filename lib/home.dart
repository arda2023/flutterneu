import 'package:flutter/material.dart';
import 'package:flutterneu/total_balance.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Mark",
                style: theme.textTheme.displayMedium?.copyWith(fontSize: 42),
              ),
              TotalBalance(),
            ],
          ),
        ),
      ),
    );
  }
}
