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
        SizedBox(
          height: 100,
        ),
        RaisedButton(
          child: Text('app bar'),
          onPressed: () => {
            Navigator.pushNamed(
              context,
              '/appBar',
            ),
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        RaisedButton(
          child: Text('tabbar controller'),
          onPressed: () => {
            Navigator.pushNamed(
              context,
              '/tabBarController',
            ),
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ],
    );
  }
}
