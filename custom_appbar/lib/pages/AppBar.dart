import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('custom appbar'),
          // leading: IconButton(
          //   icon: Icon(Icons.medical_services),
          //   onPressed: () => print('test'),
          // ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => print('search'),
            ),
            // IconButton(
            //   icon: Icon(Icons.golf_course),
            //   onPressed: () => print('golf_course'),
            // ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: '热门',
              ),
              Tab(
                text: '推荐',
              )
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
                ListTile(
                  title: Text('bbb'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
