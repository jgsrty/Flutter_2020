import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _list = [];

  @override
  void initState() {
    super.initState();
    // this._getData();
  }

  _getData() async {
    setState(() {
      this._list = [];
    });
    var url =
        'http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1';
    Response res = await Dio().get(url);

    setState(() {
      this._list = json.decode(res.data)['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text('news'),
          onPressed: () => Navigator.pushNamed(context, '/news'),
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        RaisedButton(
          child: Text('dio'),
          onPressed: () => _getData(),
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        Container(
          height: 300,
          child: this._list.length > 0
              ? ListView(
                  children: this._list.map((v) {
                    return ListTile(
                      title: Text(v['title']),
                    );
                  }).toList(),
                )
              : Text('加载中。。。'),
        )
      ],
    );
  }
}
