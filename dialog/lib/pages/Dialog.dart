import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  _alertDialog() async {
    var res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示信息'),
          content: Text('内容内容内容内容内容内容内'),
          actions: [
            FlatButton(
              onPressed: () {
                print('cancel');
              },
              child: Text('取消'),
            ),
            FlatButton(
              onPressed: () {
                print('submit');
                Navigator.pop(context, 'ok');
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
    print(res);
  }

  _simpleDialog() async {
    var res = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('选择内容'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                print('cancel');
              },
              child: Text('取消'),
            ),
            SimpleDialogOption(
              onPressed: () {
                print('submit');
                Navigator.pop(context, 'ok');
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
    print(res);
  }

  _modelDialog() async {
    var res = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text('item1'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('item2'),
                onTap: () {
                  Navigator.pop(context, 'ok');
                },
              ),
              Divider(),
              ListTile(
                title: Text('item3'),
                onTap: () {},
              )
            ],
          ),
        );
      },
    );
    print(res);
  }

  _toase() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dialog'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('alert dialog'),
            onPressed: _alertDialog,
          ),
          RaisedButton(
            child: Text('simple dialog'),
            onPressed: _simpleDialog,
          ),
          RaisedButton(
            child: Text('model dialog'),
            onPressed: _modelDialog,
          ),
          RaisedButton(
            child: Text('toast'),
            onPressed: _toase,
          ),
        ],
      ),
    );
  }
}
