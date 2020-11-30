import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/Form.dart';
import '../pages/Search.dart';
import '../pages/Product.dart';
import '../pages/ProductInfo.dart';
import '../pages/user/login.dart';
import '../pages/user/registerFirst.dart';
import '../pages/user/registerSecond.dart';
import '../pages/user/registerThird.dart';

final routes = {
  '/': (ctx) => Tabs(),
  '/form': (ctx) => FormPage(),
  '/search': (ctx, {arguments}) => SearchPage(arguments: arguments),
  '/product': (ctx, {arguments}) => ProductPage(),
  '/productInfo': (ctx, {arguments}) => ProductInfoPage(arguments: arguments),
  '/login': (ctx, {arguments}) => LoginPage(),
  '/registerFirst': (ctx, {arguments}) => RegisterFirst(),
  '/registerSecond': (ctx, {arguments}) => RegisterSecond(),
  '/registerThird': (ctx, {arguments}) => RegisterThird(),
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
