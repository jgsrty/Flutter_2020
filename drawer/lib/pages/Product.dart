import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('加载商品详情页'),
            onPressed: () => {
              Navigator.pushNamed(
                context,
                '/productInfo',
                arguments: {'pid': 123123},
              ),
            },
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
          ),
        ],
      ),
    );
  }
}
