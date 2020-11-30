import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('list -item'),
        ),
        ListTile(
          title: Text('list -item'),
        ),
        RaisedButton(
          child: Text('点击登陆'),
          onPressed: () => {
            Navigator.pushNamed(context, '/login'),
          },
        ),
        RaisedButton(
          child: Text('点击注册'),
          onPressed: () => {
            Navigator.pushNamed(context, '/registerFirst'),
          },
        )
      ],
    );
  }
}
