import 'dart:async';
import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  final String title;
  final String content;
  MyDialog({this.title = '', this.content = ''});

  _showTimer(context) {
    Timer.periodic(Duration(milliseconds: 1500), (t) {
      Navigator.pop(context);
      t.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(title),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: () => Navigator.pop(context),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Text(content),
              )
            ],
          ),
        ),
      ),
    );
  }
}
