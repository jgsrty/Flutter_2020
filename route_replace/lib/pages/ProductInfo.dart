import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  final arguments;
  ProductInfoPage({Key key, this.arguments}) : super(key: key);

  @override
  _ProductInfoPageState createState() =>
      _ProductInfoPageState(arguments: this.arguments);
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  var arguments;
  _ProductInfoPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('productinfo')),
      body: Text('pid=${arguments["pid"]}'),
    );
  }
}
