import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/News.dart';
import '../pages/Test.dart';
import '../pages/NewsContent.dart';

final routes = {
  '/': (ctx) => Tabs(),
  '/news': (ctx) => NewsPage(),
  '/test': (ctx) => TestPage(),
  '/newsContent': (ctx, {arguments}) => NewsContentPage(arguments: arguments),
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
