import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:date_format/date_format.dart';

class CupertinoDatePage extends StatefulWidget {
  CupertinoDatePage({Key key}) : super(key: key);

  @override
  _CupertinoDatePageState createState() => _CupertinoDatePageState();
}

class _CupertinoDatePageState extends State<CupertinoDatePage> {
  DateTime _dateTime = DateTime.now();
  _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('确定', style: TextStyle(color: Colors.red)),
      ),
      minDateTime: DateTime.parse('1980-01-01'),
      maxDateTime: DateTime.parse('2200-12-12'),
      initialDateTime: _dateTime,
      dateFormat: 'yyyy-MMMM-dd',
      locale: DateTimePickerLocale.zh_cn,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      // onChange: (dateTime, List<int> index) {
      //   setState(() {
      //     _dateTime = dateTime;
      //   });
      // },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cupertino'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(formatDate(_dateTime, [yyyy, '年', mm, '月', dd])),
                  ],
                ),
                onTap: _showDatePicker,
              ),
            ],
          )
        ],
      ),
    );
  }
}
