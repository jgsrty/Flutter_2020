import 'package:flutter/material.dart';
import './Home.dart';
import './Category.dart';
import './Shop.dart';
import './User.dart';
import '../../services/ScreenAdapter.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  var _pageController;
  List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    ShopPage(),
    UserPage(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._pageController = PageController(initialPage: this._currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      // appBar: ,
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (ind) {
          setState(() {
            _currentIndex = ind;
          });
        },
        // physics: NeverScrollableScrollPhysics(), //禁止tab滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (ind) {
          setState(() {
            _currentIndex = ind;
            this._pageController.jumpToPage(ind);
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '分类',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: '购物车',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
