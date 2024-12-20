import 'GridViewLearning.dart';
import 'Newspage.dart';
import 'package:flutter/material.dart';
import 'ListViewLearning.dart';
import 'PostNews.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Newspage(),
    Gridviewlearning(),
    ListWithCard(),
    Postnews()
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.blueGrey,
        onTap:  (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: 'GridView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ListView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post Data',
          )
        ],
      ),
    );
  }
}