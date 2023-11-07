import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/page/main/chat.dart';
import 'package:sample/page/main/develop.dart';
import 'package:sample/page/main/feed.dart';
import 'package:sample/page/main/friend.dart';
import 'package:sample/page/main/profile.dart';

class Home extends StatefulWidget {
  final int selectedIndex;

  const Home({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;

  final List<Widget> _pages = [
    Feed(),
    Friend(),
    Chat(),
    Develop(),
    Profile(),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('헤더'),
        backgroundColor: Colors.white, // Set background color to white
        foregroundColor: Colors.black, // Set font color to black
        elevation: 0, // Set elevation to 0
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friend',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.developer_mode),
            label: 'Dev',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
