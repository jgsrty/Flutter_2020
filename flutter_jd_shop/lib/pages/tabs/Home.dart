import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../services/ScreenAdapter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return ListView(
      children: [
        _indexSwiper(),
        SizedBox(height: ScreenAdapter.height(5)),
        _indexTitle('猜你喜欢'),
        _indexLikes(),
        _indexTitle('热门推荐'),
        Container(
          margin: EdgeInsets.all(ScreenAdapter.width(10)),
          child: Wrap(
            runSpacing: ScreenAdapter.height(10),
            spacing: ScreenAdapter.width(10),
            children: [
              _productItem(),
              _productItem(),
              _productItem(),
              _productItem(),
            ],
          ),
        )
      ],
    );
  }

  // 轮播
  Widget _indexSwiper() {
    List<Map> imageList = [
      {'url': 'https://www.itying.com/images/flutter/slide01.jpg'},
      {'url': 'https://www.itying.com/images/flutter/slide02.jpg'},
      {'url': 'https://www.itying.com/images/flutter/slide03.jpg'}
    ];
    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              imageList[index]['url'],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: imageList.length,
          pagination: new SwiperPagination(),
        ),
      ),
    );
  }

  // title
  _indexTitle(val) {
    return Container(
      height: ScreenAdapter.height(30),
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
      height: ScreenAdapter.height(200),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
                height: ScreenAdapter.height(150),
                // width: ScreenAdapter.width(150),
                child: Image.network(
                  'https://www.itying.com/images/flutter/hot${index + 1}.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Text('第$index条')
            ],
          );
        },
      ),
    );
  }

  //商品
  _productItem() {
    var width = (ScreenAdapter.screenWidth() - ScreenAdapter.width(34)) / 2;
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(10)),
      width: width,
      decoration: BoxDecoration(
        border:
            Border.all(width: ScreenAdapter.width(1), color: Colors.black26),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image.network(
                'https://www.itying.com/images/flutter/list1.jpg',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
            child: Text(
              '放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大放大',
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
                    '¥100.00',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '¥199.00',
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
  }
}
