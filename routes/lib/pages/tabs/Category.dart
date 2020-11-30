import 'package:flutter/material.dart';
import '../Form.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text('加载表单页传值'),
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => FormPage(title: '我是传入的form')),
            )
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ],
    );
  }
}
