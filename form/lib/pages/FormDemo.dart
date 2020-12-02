import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
  FormDemoPage({Key key}) : super(key: key);

  @override
  _FormDemoPageState createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  Map info = {'username': '', 'sex': 1, 'hobby': []};
  List hobby = [
    {'checked': true, 'title': '吃饭', 'id': 1},
    {'checked': false, 'title': '睡觉', 'id': 2},
    {'checked': false, 'title': '打豆豆', 'id': 3},
  ];

  List<Widget> _getHobby() {
    List<Widget> tempList = [];
    for (var i = 0; i < this.hobby.length; i++) {
      tempList.add(Row(
        children: [
          Text(this.hobby[i]['title']),
          Checkbox(
            value: this.hobby[i]['checked'],
            onChanged: (v) {
              setState(() => {this.hobby[i]['checked'] = v});
            },
          ),
        ],
      ));
    }
    return tempList;
  }

  _sexChanged(val) {
    setState(() {
      this.info['sex'] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: '输入用户信息'),
              onChanged: (v) => {
                setState(() => {this.info['username'] = v})
              },
            ),
            Row(
              children: [
                Text('男'),
                Radio(
                  value: 1,
                  groupValue: this.info['sex'],
                  onChanged: _sexChanged,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('女'),
                Radio(
                  value: 2,
                  groupValue: info['sex'],
                  onChanged: _sexChanged,
                ),
              ],
            ),
            Wrap(
              children: _getHobby(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: RaisedButton(
                child: Text('查看信息'),
                onPressed: () {
                  info['hobby'] = [];
                  hobby.forEach((val) {
                    if (val['checked'] == true) {
                      info['hobby'].add(val['id']);
                    }
                  });
                  print(this.info);
                },
                color: Colors.blue,
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
