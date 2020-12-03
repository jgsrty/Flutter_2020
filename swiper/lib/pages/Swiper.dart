import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  SwiperPage({Key key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  List<Map> listImage = [
    {
      'url':
          'https://dongxiaofang.oss-cn-hangzhou.aliyuncs.com/business/572HittReD.jpg',
    },
    {
      'url':
          'https://dongxiaofang.oss-cn-hangzhou.aliyuncs.com/business/yKFYGsA7pQ.jpg',
    },
    {
      'url':
          'https://dongxiaofang.oss-cn-hangzhou.aliyuncs.com/business/4hTHkssspt.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('swiper'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 16 / 6,
                child: Swiper(
                  autoplay: true,
                  loop: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      listImage[index]['url'],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: listImage.length,
                  // pagination: SwiperPagination(),
                  // control: SwiperControl(),
                ),
              ),
            ),
            Row(
              children: [
                Text('文本'),
              ],
            )
          ],
        ));
  }
}
