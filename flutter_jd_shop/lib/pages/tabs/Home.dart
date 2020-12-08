import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../services/ScreenAdapter.dart';
import 'package:dio/dio.dart';
import '../../config/Config.dart';
import '../../model/SwiperModel.dart';
import '../../model/ProductModel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List _swiperData = [];
  List _productLikeData = [];
  List _productHotData = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSwiperData();
    _getProductLikeData();
    _getProductHotData();
  }

  // 轮播数据
  _getSwiperData() async {
    var api = '${Config.domain}api/focus';
    var res = await Dio().get(api);
    setState(() {
      this._swiperData = SwiperModel.fromJson(res.data).result;
    });
  }

  // 猜你喜欢数据
  _getProductLikeData() async {
    var api = '${Config.domain}api/plist?is_hot=1';
    var res = await Dio().get(api);
    setState(() {
      this._productLikeData = ProductModel.fromJson(res.data).result;
    });
  }

  // 热门推荐数据
  _getProductHotData() async {
    var api = '${Config.domain}api/plist?is_best=1';
    var res = await Dio().get(api);
    setState(() {
      this._productHotData = ProductModel.fromJson(res.data).result;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: [
          _indexSwiper(),
          SizedBox(height: ScreenAdapter.height(5)),
          _indexTitle('猜你喜欢'),
          _indexLikes(),
          _indexTitle('热门推荐'),
          _productItem()
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: InkWell(
        child: Container(
          padding: EdgeInsets.only(left: 10),
          height: ScreenAdapter.height(76),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(233, 233, 233, .8)),
          child: Row(
            children: [
              Icon(Icons.search, size: ScreenAdapter.size(34)),
              Text(
                'iphone',
                style: TextStyle(fontSize: ScreenAdapter.size(28)),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/search');
        },
      ),
      leading: IconButton(
        icon: Icon(
          Icons.center_focus_weak,
          size: ScreenAdapter.size(40),
          color: Colors.black87,
        ),
        onPressed: null,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.message,
            size: ScreenAdapter.size(40),
            color: Colors.black87,
          ),
          onPressed: null,
        ),
      ],
    );
  }

  // 轮播
  Widget _indexSwiper() {
    if (_swiperData.length > 0) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              String pic = _swiperData[index].pic;
              pic = Config.domain + pic.replaceAll('\\', '/');
              return new Image.network(
                pic,
                fit: BoxFit.fill,
              );
            },
            autoplay: true,
            itemCount: _swiperData.length,
            pagination: new SwiperPagination(),
          ),
        ),
      );
    } else {
      return Text('加载中');
    }
  }

  // title
  _indexTitle(val) {
    return Container(
      height: ScreenAdapter.height(40),
      margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
      padding: EdgeInsets.only(left: ScreenAdapter.width(10)),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.red,
            width: ScreenAdapter.width(10),
          ),
        ),
      ),
      child: Text(
        val,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  // 猜你喜欢
  _indexLikes() {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(10)),
      height: ScreenAdapter.height(210),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _productLikeData.length,
        itemBuilder: (BuildContext context, int index) {
          String pic = _productLikeData[index].sPic;
          pic = Config.domain + pic.replaceAll('\\', '/');
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
                height: ScreenAdapter.height(140),
                width: ScreenAdapter.width(140),
                child: Image.network(
                  pic,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: ScreenAdapter.height(40),
                width: ScreenAdapter.width(140),
                child: Text(
                  '￥${_productLikeData[index].price}',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  //热门推荐
  _productItem() {
    var width = (ScreenAdapter.screenWidth() - ScreenAdapter.width(34)) / 2;

    return Container(
      margin: EdgeInsets.all(ScreenAdapter.width(10)),
      child: Wrap(
        runSpacing: ScreenAdapter.height(10),
        spacing: ScreenAdapter.width(10),
        children: this._productHotData.map((val) {
          var pic = val.sPic;
          pic = Config.domain + pic.replaceAll('\\', '/');
          return Container(
            padding: EdgeInsets.all(ScreenAdapter.width(10)),
            width: width,
            decoration: BoxDecoration(
              border: Border.all(
                  width: ScreenAdapter.width(1), color: Colors.black26),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.network(pic, fit: BoxFit.cover),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
                  child: Text(
                    val.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '¥${val.price}',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '¥${val.oldPrice}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
