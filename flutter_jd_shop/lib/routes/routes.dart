import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/ProductList.dart';
import '../pages/Search.dart';

final routes = {
  '/': (ctx) => Tabs(),
  '/productList': (ctx, {arguments}) => ProductListPage(arguments: arguments),
  '/search': (
    ctx,
  ) =>
      Search(),
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
