import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/Form.dart';
import '../pages/Search.dart';
import '../pages/Product.dart';
import '../pages/ProductInfo.dart';
import '../pages/User.dart';

final routes = {
  '/': (ctx) => Tabs(),
  '/form': (ctx) => FormPage(),
  '/search': (ctx, {arguments}) => SearchPage(arguments: arguments),
  '/product': (ctx, {arguments}) => ProductPage(),
  '/productInfo': (ctx, {arguments}) => ProductInfoPage(arguments: arguments),
  '/user': (ctx, {arguments}) => UserPage(),
};

var generateRoute = (RouteSettings settings) {
  // 固定写法
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context),
      );
      return route;
    }
  }
};
