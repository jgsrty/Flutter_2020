import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  String title;
  // FormPage({Key key, this.title}) : super(key: key);
  FormPage({this.title = 'form.'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () => {Navigator.of(context).pop()},
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('表单1')),
          ListTile(title: Text('表单2')),
        ],
      ),
    );
  }
}
