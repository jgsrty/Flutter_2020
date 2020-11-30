import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login page')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('这是登陆页'),
            RaisedButton(
              child: Text('点击登陆'),
              onPressed: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }
}
