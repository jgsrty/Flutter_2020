import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static init(ctx) {
    ScreenUtil.init(ctx, designSize: Size(750, 1334));
  }

  static height(val) {
    return ScreenUtil().setHeight(val);
  }

  static width(val) {
    return ScreenUtil().setWidth(val);
  }

  static size(val) {
    return ScreenUtil().setSp(val);
  }

  static screenWidth() {
    return ScreenUtil().screenWidth;
  }
}
