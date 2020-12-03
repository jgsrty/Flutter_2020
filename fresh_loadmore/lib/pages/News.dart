import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List _list = [
    // {'title': '123'}
  ];
  int _page = 1;
  bool _hasMore = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    this._getData();
    _scrollController.addListener(() {
      // print(_scrollController.position.pixels); //滚动条滚动距离
      // print(_scrollController.position.maxScrollExtent); //获取整个页面高度
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getData();
      }
    });
  }

  _getData() async {
    var url =
        'http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$_page';
    if (_hasMore) {
      Response res = await Dio().get(url);
      var data = json.decode(res.data)['result'];
      setState(() {
        this._list.addAll(data);
        this._page++;
        print(_list.length);
      });
      if (data.length < 20) {
        setState(() {
          _hasMore = false;
        });
      }
    }
  }

  Future<void> _onRefresh() async {
    print('refresh');
    // await Future.delayed(Duration(milliseconds: 2000), () {
    await _getData();
    print('请求结束');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_hasMore.toString()),
      ),
      body: _list.length > 0
          ? RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  if (index == _list.length - 1) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            _list[index]['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Divider(),
                        _getMoreWidget()
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            _list[index]['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Divider()
                      ],
                    );
                  }
                },
              ),
            )
          : _getMoreWidget(),
    );
  }

  //加载中
  Widget _getMoreWidget() {
    if (_hasMore) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('加载中...'),
              CircularProgressIndicator(
                strokeWidth: 1,
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text('到底了'),
      );
    }
  }
}
