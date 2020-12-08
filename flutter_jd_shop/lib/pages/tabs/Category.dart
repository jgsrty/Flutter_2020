import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import '../../model/CategoryModel.dart';
import 'package:dio/dio.dart';
import '../../config/Config.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  List _leftCateList = [];
  List _rightCateList = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getLeftCateData();
  }

  _getLeftCateData() async {
    var api = '${Config.domain}api/pcate';
    var res = await Dio().get(api);
    setState(() {
      this._leftCateList = CategoryModel.fromJson(res.data).result;
      this._getRightCateData(this._leftCateList[0].sId);
    });
  }

  _getRightCateData(ind) async {
    var api = '${Config.domain}api/pcate?pid=$ind';
    var res = await Dio().get(api);
    setState(() {
      this._rightCateList = CategoryModel.fromJson(res.data).result;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    var _leftWidth = ScreenAdapter.screenWidth() / 5;
    var _rightItemWidth = (ScreenAdapter.screenWidth() - _leftWidth - 40) / 3;
    var _rightItemHeight = _rightItemWidth + ScreenAdapter.height(32);

    return Row(
      children: [
        _categoryLeft(_leftWidth),
        _categoryRight(_rightItemWidth, _rightItemHeight)
      ],
    );
  }

  // 左侧分类
  _categoryLeft(_leftWidth) {
    return Container(
      width: _leftWidth,
      height: double.infinity,
      child: ListView.builder(
        itemCount: _leftCateList.length,
        itemBuilder: (ctx, ind) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = ind;
                    _getRightCateData(_leftCateList[ind].sId);
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: ScreenAdapter.height(24)),
                  child: Text(
                    _leftCateList[ind].title,
                    textAlign: TextAlign.center,
                  ),
                  width: double.infinity,
                  height: ScreenAdapter.height(84),
                  color: _selectedIndex == ind
                      ? Color.fromRGBO(240, 246, 246, .9)
                      : Colors.white,
                ),
              ),
              Divider(height: 1)
            ],
          );
        },
      ),
    );
  }

  // 右侧分类
  _categoryRight(_rightItemWidth, _rightItemHeight) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        color: Color.fromRGBO(240, 246, 246, .9),
        child: GridView.builder(
          itemCount: _rightCateList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: _rightItemWidth / _rightItemHeight,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, ind) {
            String pic = Config.domain + _rightCateList[ind].pic;
            pic = pic.replaceAll('\\', '/');
            return InkWell(
              child: Container(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        pic,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: ScreenAdapter.height(32),
                      child: Text(_rightCateList[ind].title),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/productList',
                    arguments: {"id": _rightCateList[ind].sId});
              },
            );
          },
        ),
      ),
    );
  }
}
