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
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Drawer Header',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text('空间'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.supervised_user_circle),
              ),
              title: Text('用户'),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.pushNamed(context, '/user'),
              },
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧 drawer'),
      ),
    );
  }
}
