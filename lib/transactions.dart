import 'package:flutter/material.dart';

class TBox {
  final String name;
  final String date;
  final double sum;
  final String category;

  const TBox({
    required this.name,
    required this.category,
    required this.date,
    required this.sum,
  });
}

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Transactions", style: theme.textTheme.titleMedium),
        backgroundColor: Colors.transparent, // passt gut zum Dark-Theme
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(children: [Box()]),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      height: 100,
    );
  }
}
