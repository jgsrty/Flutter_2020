import 'package:flutter/material.dart';

class RegisterSecond extends StatelessWidget {
  const RegisterSecond({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('register second')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('这是注册页B'),
            RaisedButton(
              child: Text('下一步'),
              onPressed: () => {
                Navigator.pushNamed(context, '/registerThird'),
              },
            ),
          ],
        ),
      ),
    );
  }
}
