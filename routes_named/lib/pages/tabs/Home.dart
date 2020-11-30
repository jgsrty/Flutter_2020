import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text('加载搜索页'),
          onPressed: () => {
            Navigator.pushNamed(
              context,
              '/search',
              arguments: {'id': 11111},
            ),
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        RaisedButton(
          child: Text('加载商品页'),
          onPressed: () => {
            Navigator.pushNamed(
              context,
              '/product',
              arguments: {'pid': 123123},
            ),
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ],
    );
  }
}
