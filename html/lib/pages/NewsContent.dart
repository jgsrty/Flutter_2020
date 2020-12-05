import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

class NewsContentPage extends StatefulWidget {
  Map arguments;
  NewsContentPage({Key key, this.arguments}) : super(key: key);

  @override
  _NewsContentPageState createState() => _NewsContentPageState(this.arguments);
}

class _NewsContentPageState extends State<NewsContentPage> {
  Map arguments;
  List list = [];
  _NewsContentPageState(this.arguments);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(this.arguments);
    _getData(this.arguments['aid']);
  }

  _getData(id) async {
    var apiUrl =
        'http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=$id';
    Response res = await Dio().get(apiUrl);
    setState(() {
      this.list = json.decode(res.data)['result'];
    });
  }

  // var htmlData = this.list.length > 0 ? list[0]['title'] : '加载中。。。';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('news content'),
      ),
      body: SingleChildScrollView(
        child: Html(
          data: list.length > 0 ? list[0]['content'] : '加载中。。。',
          //Optional parameters:
          style: {
            "html": Style(
              backgroundColor: Colors.black12,
//              color: Colors.white,
            ),
//            "h1": Style(
//              textAlign: TextAlign.center,
//            ),
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: EdgeInsets.all(6),
            ),
            "var": Style(fontFamily: 'serif'),
          },
          customRender: {
            "flutter": (RenderContext context, Widget child, attributes, _) {
              return FlutterLogo(
                style: (attributes['horizontal'] != null)
                    ? FlutterLogoStyle.horizontal
                    : FlutterLogoStyle.markOnly,
                textColor: context.style.color,
                size: context.style.fontSize.size * 5,
              );
            },
          },
          onLinkTap: (url) {
            print("Opening $url...");
          },
          onImageTap: (src) {
            print(src);
          },
          onImageError: (exception, stackTrace) {
            print(exception);
          },
        ),
        // Text(list.length > 0 ? list[0]['title'] : '加载中。。。'),
      ),
    );
  }
}
