import 'package:flutter/material.dart';

class TBox {
  final String name;
  final String date;
  final double sum;

  const TBox({required this.name, required this.date, required this.sum});
}

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [])),
    );
  }
}
