import 'package:flutter/material.dart';

class WorkoutReport extends StatelessWidget {
  const WorkoutReport({
    super.key,
    required this.selected,
  });
  final DateTime selected;

  @override
  Widget build(BuildContext context) {
    return const Text(
      '운동기록',
      style: TextStyle(color: Colors.white),
    );
  }
}
