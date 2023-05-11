import 'package:flutter/material.dart';
import 'package:gotogym/widgets/calender_widget.dart';
import 'package:gotogym/widgets/timer_widget.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '캘린더'),
    Tab(text: '타이머'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: TabBar(
          indicatorColor: Colors.amber,
          labelColor: Colors.white,
          tabs: myTabs,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TabBarView(
            children: [
              Calendar(),
              Timer(),
            ],
          ),
        ),
      ),
    );
  }
}
