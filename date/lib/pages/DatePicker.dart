import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DatePickerPage extends StatefulWidget {
  DatePickerPage({Key key}) : super(key: key);

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  var current = DateTime.now();
  var currentTime = TimeOfDay(hour: 12, minute: 00);
  // flutter自带日期组件
  _showDatePicker() async {
    var res = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(1980),
      lastDate: DateTime(3000),
    );
    setState(() {
      this.current = res;
    });
  }

  _showTimePicker() async {
    var res = await showTimePicker(context: context, initialTime: currentTime);
    setState(() {
      this.currentTime = res;
    });
  }

  var now = DateTime.now();
  @override
  void initState() {
    super.initState();
    print(now);
    print(now.millisecondsSinceEpoch);
    print(DateTime.fromMicrosecondsSinceEpoch(now.millisecondsSinceEpoch));
    print(formatDate(now, [yyyy, '年', mm, '月', dd, ' ', hh, ':', nn, ':', ss]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('date'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Row(
                  children: [
                    Text(
                      formatDate(current, [yyyy, '年', mm, '月', dd]),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: () {
                  // print('打开日期组件');
                  _showDatePicker();
                },
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentTime.format(context)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                onTap: () {
                  // print('打开日期组件');
                  _showTimePicker();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
