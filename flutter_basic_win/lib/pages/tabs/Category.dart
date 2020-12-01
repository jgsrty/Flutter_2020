import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
            isScrollable: true,
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: '直播'),
              Tab(text: '回放'),
              Tab(text: '录播'),
              Tab(text: '录像'),
              Tab(text: '体育'),
              Tab(text: '游戏'),
              Tab(text: '视频'),
              Tab(text: '新闻'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                ListTile(
                  title: Text('aaa'),
                ),
                ListTile(
                  title: Text('aaa'),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('bbb'),
                ),
                ListTile(
                  title: Text('bbb'),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('ccc'),
                ),
                ListTile(
                  title: Text('ccc'),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('ddd'),
                ),
                ListTile(
                  title: Text('ddd'),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('aaa'),
                ),
                ListTile(
                  title: Text('aaa'),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('bbb'),
                ),
                ListTile(
                  title: Text('bbb'),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('ccc'),
                ),
                ListTile(
                  title: Text('ccc'),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('ddd'),
                ),
                ListTile(
                  title: Text('ddd'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
