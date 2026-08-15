import 'package:flutter/material.dart';

class Auswahl extends StatefulWidget {
  const Auswahl({super.key});

  @override
  _AuswahlState createState() => _AuswahlState();
}

class _AuswahlState extends State<Auswahl> {
  @override
  Widget build(BuildContext context) {
    final colorSheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(child: Kasten());
  }
}

class Kasten extends StatelessWidget {
  const Kasten({super.key});

  @override
  Widget build(BuildContext context) {
    final colorSheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: colorSheme.onPrimary),
      child: Text(
        "onion",
        style: textTheme.displaySmall?.copyWith(color: colorSheme.surface),
      ),
    );
  }
}
