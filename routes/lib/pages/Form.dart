import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  String title;
  // FormPage({Key key, this.title}) : super(key: key);
  FormPage({this.title = 'form.'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () => {Navigator.of(context).pop()},
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('表单1')),
          ListTile(title: Text('表单2')),
        ],
      ),
    );
  }
}

// class FormPage extends StatefulWidget {
//   String title;
//   FormPage({Key key, this.title = 'forms'}) : super(key: key);

//   @override
//   _FormPageState createState() => _FormPageState({title});
// }

// class _FormPageState extends State<FormPage> {
//   String title;
//   _FormPageState(title);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: ListView(
//         children: [
//           ListTile(title: Text('表单1')),
//           ListTile(title: Text('表单2')),
//           ListTile(title: Text('表单3')),
//         ],
//       ),
//     );
//   }
// }
