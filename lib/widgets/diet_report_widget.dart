import 'package:flutter/material.dart';

class DietReport extends StatelessWidget {
  const DietReport({
    super.key,
    required this.selected,
  });
  final DateTime selected;

  @override
  Widget build(BuildContext context) {
    return const Text(
      '식단기록',
      style: TextStyle(color: Colors.white),
    );
  }
}
