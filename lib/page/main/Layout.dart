import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/component/appBarCommunity.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:sample/component/appBarHome.dart';
import 'package:sample/component/appBarProfile.dart';
import 'package:sample/page/main/community.dart';
import 'package:sample/page/main/rank.dart';
import 'package:sample/page/main/home.dart';
import 'package:sample/page/main/problem.dart';
import 'package:sample/page/main/myProfile.dart';

class Layout extends StatefulWidget {
  final int selectedIndex;

  const Layout({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Problem(),
    Community(),
    Rank(),
    MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar;
    if (_selectedIndex == 0) {
      appBar = appBarHome();
    } else if (_selectedIndex == 1) {
      appBar = appBarHome();
    } else if (_selectedIndex == 2) {
      appBar = appBarCommunity();
    } else if (_selectedIndex == 3) {
      appBar = appBarHome();
    } else if (_selectedIndex == 4) {
      appBar = appBarProfile();
    } else {
      appBar = appBarProfile();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_sharp),
            label: '문제',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium_outlined),
            label: '랭킹',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        showUnselectedLabels:
            true, // Set this to true to display unselected labels
      ),
    );
  }
}
