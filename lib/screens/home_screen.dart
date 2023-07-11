import 'package:flutter/material.dart';
import 'package:gotogym/screens/community_screen.dart';
import 'package:gotogym/screens/mypage_screen.dart';
import 'package:gotogym/screens/report_screen.dart';
import 'package:gotogym/screens/shorts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    ReportScreen(),
    ShortsScreen(),
    CommunityScreen(),
    MypageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: const Text('GoToGym'),
        ),
        backgroundColor: Colors.black,
        elevation: 2,
        ),
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_arrow_outlined,
            ),
            label: '헬쇼츠',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer,
            ),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box_rounded,
            ),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );

  }
}
