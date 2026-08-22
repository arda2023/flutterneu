import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '\$',
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Category",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    IconButton.outlined(
                      onPressed: () {},
                      icon: Icon(Icons.local_dining),
                      style: IconButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        side: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        fixedSize: const Size(62, 62),
                      ),
                    ),
                    SizedBox(width: 15),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: Icon(Icons.games),
                      style: IconButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        side: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        fixedSize: const Size(62, 62),
                      ),
                    ),
                    SizedBox(width: 15),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: Icon(Icons.airplane_ticket),
                      style: IconButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        side: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        fixedSize: const Size(62, 62),
                      ),
                    ),
                    SizedBox(width: 15),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: Icon(Icons.checkroom),
                      style: IconButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        side: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        fixedSize: const Size(62, 62),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
