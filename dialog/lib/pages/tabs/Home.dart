import 'package:flutter/material.dart';
import '../../components/MyDialog.dart';

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
          child: Text('dialog'),
          onPressed: () => {
            Navigator.pushNamed(
              context,
              '/dialog',
            ),
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        RaisedButton(
          child: Text('自定义dialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return MyDialog(title: 'title', content: 'content');
              },
            );
          },
        ),
      ],
    );
  }
}
