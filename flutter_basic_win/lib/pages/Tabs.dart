import 'package:flutter/material.dart';
import './tabs/Home.dart';
import './tabs/Category.dart';
import './tabs/Setting.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('BottomTabBar')),
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
