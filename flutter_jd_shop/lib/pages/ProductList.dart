import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';
import 'package:dio/dio.dart';
import '../config/Config.dart';
import '../model/ProductModel.dart';
import '../widget/Loading.dart';

class ProductListPage extends StatefulWidget {
  Map arguments;
  ProductListPage({Key key, this.arguments}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController();
  var _initTextController = TextEditingController();
  int _page = 1; //分页
  int _pageSize = 8;
  List _productDataList = [];
  String _sort = ''; //排序
  bool _hasMore = true;
  bool _hasData = true;
  String _searchParams;

  @override
  void initState() {
    super.initState();
    if (widget.arguments['key'] == null) {
      _searchParams = 'cid=${widget.arguments["id"]}';
      _initTextController.text = '';
    } else {
      _initTextController.text = widget.arguments["key"];
      _searchParams = 'search=${_initTextController.text}';
    }
    _getProductListData();
    // 监听滚动条
    _scrollController.addListener(() {
      //_scrollController.position.pixels //获取滚动条滚动高度
      //_scrollController.position.maxScrollExtent  //获取页面高度
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          _hasMore) {
        _getProductListData();
      }
    });
  }

  _getProductListData() async {
    if (widget.arguments['key'] == null) {
      _searchParams = 'cid=${widget.arguments["id"]}';
    } else {
      _searchParams = 'search=${_initTextController.text}';
      this._page = 1;
    }
    var api =
        '${Config.domain}api/plist?$_searchParams&page=$_page&pageSize=$_pageSize&sort=$_sort';
    print(api);
    var res = await Dio().get(api);
    var productData = ProductModel.fromJson(res.data).result;
    _hasData = productData.length == 0 && _page == 1 ? true : false;
    if (productData.length < this._pageSize) {
      setState(() {
        this._productDataList.addAll(productData);
        this._hasMore = false;
      });
    } else {
      setState(() {
        this._productDataList.addAll(productData);
        this._hasMore = true;
        this._page++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      // body: Text("${widget.arguments}"),
      endDrawer: Drawer(
        child: Container(
          child: Text('筛选'),
        ),
      ),
      // body: GestureDetector(
      //   behavior: HitTestBehavior.translucent,
      //   onTap: () {
      //     // 触摸收起键盘
      //     FocusScope.of(context).requestFocus(FocusNode());
      //   },
      //   child: _hasData
      //       ? Center(child: Text('没有相关数据'))
      //       : Stack(
      //           children: [
      //             _productList(),
      //             _positionFilter(),
      //           ],
      //         ),
      // ),
      body: _hasData
          ? Center(child: Text('没有相关数据'))
          : Stack(
              children: [
                _productList(),
                _positionFilter(),
              ],
            ),
    );
  }

  _appBar() {
    return AppBar(
      title: Container(
        height: ScreenAdapter.height(68),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(233, 233, 233, .8),
        ),
        child: TextField(
          controller: _initTextController,
          // autofocus: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          // onChanged: (v) {
          //   _initTextController.text = v;
          // },
        ),
      ),
      actions: [
        InkWell(
          child: Container(
            height: ScreenAdapter.height(68),
            width: ScreenAdapter.width(80),
            child: Center(
              child: Text('搜索'),
            ),
          ),
          onTap: () {
            setState(() {
              _getProductListData();
              FocusScope.of(context).unfocus();
            });
          },
        ),
      ],
    );
  }

  _showMore(ind) {
    if (_hasMore) {
      return ind == _productDataList.length - 1 ? LoadingWidget() : Text('');
    } else {
      return ind == _productDataList.length - 1
          ? Text('---没有更多了---')
          : Text('');
    }
  }

  // 商品列表
  _productList() {
    if (_productDataList.length > 0) {
      return Container(
        margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, ind) {
            String pic = Config.domain + _productDataList[ind].pic;
            pic = pic.replaceAll('\\', '/');
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: ScreenAdapter.width(180),
                      height: ScreenAdapter.height(180),
                      child: Image.network(
                        pic,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: ScreenAdapter.height(180),
                        margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _productDataList[ind].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: ScreenAdapter.height(36),
                                  margin: EdgeInsets.only(
                                      right: ScreenAdapter.width(10)),
                                  padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(230, 230, 230, .8)),
                                  child: Text('5G'),
                                ),
                                Container(
                                  height: ScreenAdapter.height(36),
                                  margin: EdgeInsets.only(
                                      right: ScreenAdapter.width(10)),
                                  padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(230, 230, 230, .8)),
                                  child: Text('128g'),
                                )
                              ],
                            ),
                            Text(
                              '￥${_productDataList[ind].price}',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(height: 10),
                _showMore(ind)
              ],
            );
          },
          itemCount: _productDataList.length,
        ),
      );
    } else {
      return LoadingWidget();
    }
  }

  // 筛选
  _positionFilter() {
    return Positioned(
      top: 0,
      // height: ScreenAdapter.height(80),
      // width: ScreenAdapter.screenWidth(),
      child: Container(
        height: ScreenAdapter.height(80),
        width: ScreenAdapter.screenWidth(),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(233, 233, 233, .8))),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                  height: ScreenAdapter.height(80),
                  child: Center(
                    child: Text(
                      '综合',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                  height: ScreenAdapter.height(80),
                  child: Center(
                    child: Text(
                      '销量',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // color: Colors.red,
                          ),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                  height: ScreenAdapter.height(80),
                  child: Center(
                    child: Text(
                      '价格',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // color: Colors.red,
                          ),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                  height: ScreenAdapter.height(80),
                  child: Center(
                    child: Text(
                      '筛选',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // color: Colors.red,
                          ),
                    ),
                  ),
                ),
                onTap: () {
                  _scaffoldKey.currentState.openEndDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
