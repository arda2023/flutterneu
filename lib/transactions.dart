import 'package:flutter/material.dart';
import 'package:flutterneu/add_transaction.dart';

class TBox {
  final String name;
  final String date;
  final double sum;
  final Category category;

  const TBox({
    required this.name,
    required this.category,
    required this.date,
    required this.sum,
  });
}

List<TBox> tboxlist = [
  TBox(
    name: "Kino",
    category: availableCategories[0],
    date: "01.01.2026",
    sum: -20.32,
  ),
];

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
          child: ListView.separated(
            itemCount: tboxlist.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = tboxlist[index];
              return Box(transaction: item); // rendert die Kachel
            },
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({super.key, required this.transaction});

  final TBox transaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: .spaceBetween,

        children: [
          Icon(transaction.category.icon, size: 40),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.name, style: theme.textTheme.titleMedium),
                Text(transaction.date, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          SizedBox(width: 20),
          Text(
            transaction.sum.toStringAsFixed(2),
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
