import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    var _leftWidth = ScreenAdapter.screenWidth() / 5;
    var _rightItemWidth = (ScreenAdapter.screenWidth() - _leftWidth - 40) / 3;
    var _rightItemHeight = _rightItemWidth + ScreenAdapter.height(30);

    return Row(
      children: [
        Container(
          width: _leftWidth,
          height: double.infinity,
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (ctx, ind) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = ind;
                      });
                    },
                    child: Container(
                      child: Text(
                        '第$ind个',
                        textAlign: TextAlign.center,
                      ),
                      width: double.infinity,
                      height: ScreenAdapter.height(50),
                      color: _selectedIndex == ind ? Colors.pink : Colors.white,
                    ),
                  ),
                  Divider()
                ],
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, .9),
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: _rightItemWidth / _rightItemHeight,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, ind) {
                return Container(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          'http://www.itying.com/images/flutter/list8.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: ScreenAdapter.height(30),
                        child: Text('女装'),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
