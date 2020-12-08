import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';
import '../services/ScreenAdapter.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _keyWords;
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: ScreenAdapter.height(68),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(233, 233, 233, .8),
          ),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (v) {
              _keyWords = v;
            },
          ),
        ),
        actions: [
          InkWell(
            child: Container(
              height: ScreenAdapter.height(68),
              width: ScreenAdapter.width(80),
              child: Center(
                child: Text('搜索'),
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/productList',
                  arguments: {'key': _keyWords});
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(ScreenAdapter.width(10)),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
              child: Text(
                '热搜',
                style: TextStyle(fontSize: ScreenAdapter.size(32)),
              ),
            ),
            Divider(height: 10),
            Wrap(
              children: [
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(8)),
                  margin: EdgeInsets.all(ScreenAdapter.width(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, .8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('女装'),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(8)),
                  margin: EdgeInsets.all(ScreenAdapter.width(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, .8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('Macbook Pro M1'),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(8)),
                  margin: EdgeInsets.all(ScreenAdapter.width(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, .8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('童装'),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(8)),
                  margin: EdgeInsets.all(ScreenAdapter.width(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, .8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('iPhone 12 mini'),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(8)),
                  margin: EdgeInsets.all(ScreenAdapter.width(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, .8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('曲奇饼干'),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
              child: Text(
                '热搜',
                style: TextStyle(fontSize: ScreenAdapter.size(32)),
              ),
            ),
            Column(
              children: [
                ListTile(title: Text('鞋子')),
                Divider(),
                ListTile(title: Text('鞋子')),
                Divider(),
                ListTile(title: Text('鞋子')),
                Divider(),
                ListTile(title: Text('鞋子')),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: ScreenAdapter.width(100),
                height: ScreenAdapter.height(64),
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     width: 1,
                //     color: Color.fromRGBO(233, 233, 233, .9),
                //   ),
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_outline),
                    Text('清空搜索项'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
