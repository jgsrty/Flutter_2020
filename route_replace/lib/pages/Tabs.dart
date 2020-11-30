import 'package:flutter/material.dart';
import './tabs/Home.dart';
import './tabs/Category.dart';
import './tabs/Setting.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState(index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  _TabsState(index) {
    _currentIndex = index;
  }
  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomTabBar')),
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,四个以上需要
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => this._currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            label: '分类',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '设置',
          )
        ],
      ),
    );
  }
}
