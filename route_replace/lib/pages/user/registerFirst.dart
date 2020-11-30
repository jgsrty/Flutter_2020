import 'package:flutter/material.dart';

class RegisterFirst extends StatelessWidget {
  const RegisterFirst({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('register first')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('这是注册页A'),
            RaisedButton(
              child: Text('下一步'),
              onPressed: () => {
                Navigator.pushNamed(context, '/registerSecond'),
                // 替换路由
                // Navigator.of(context).pushReplacementNamed('/registerSecond')
              },
            ),
          ],
        ),
      ),
    );
  }
}
