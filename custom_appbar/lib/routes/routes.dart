import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/AppBar.dart';
import '../pages/TabBarController.dart';

final routes = {
  '/': (ctx) => Tabs(),
  '/appBar': (ctx) => AppBarPage(),
  '/tabBarController': (ctx) => TabBarControllerPage(),
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
