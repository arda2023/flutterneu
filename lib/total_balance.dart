import 'package:flutter/material.dart';
import 'package:flutterneu/add_transaction.dart';

class TotalBalance extends StatefulWidget {
  const TotalBalance({super.key});

  @override
  TotalBalanceState createState() => TotalBalanceState();
}

class TotalBalanceState extends State<TotalBalance> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: .start,
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
        SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddTransaction(),
                    ),
                  );
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text("Add transaction"),
                style: ElevatedButton.styleFrom(minimumSize: const Size(0, 48)),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(0, 48),
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("View All"),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          height: 250,
        ),
      ],
    );
  }
}
