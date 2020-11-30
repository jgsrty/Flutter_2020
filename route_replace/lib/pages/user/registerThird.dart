import 'package:flutter/material.dart';

import '../Tabs.dart';

class RegisterThird extends StatelessWidget {
  const RegisterThird({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('register third')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('这是注册页C'),
            RaisedButton(
              child: Text('注册成功'),
              onPressed: () => {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Tabs(index: 2)),
                  (route) => route == null,
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
