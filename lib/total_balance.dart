import 'package:flutter/material.dart';

class TotalBalance extends StatefulWidget {
  const TotalBalance({super.key});

  @override
  TotalBalanceState createState() => TotalBalanceState();
}

class TotalBalanceState extends State<TotalBalance> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: Column(
        children: [
          Text(
            "Total balance",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "\$1000",
            style: theme.textTheme.displayMedium?.copyWith(fontSize: 42),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Add transaction")),
              ElevatedButton(onPressed: () {}, child: Text("View All")),
            ],
          ),
        ],
      ),
    );
  }
}
