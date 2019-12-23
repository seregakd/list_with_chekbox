import 'package:flutter/material.dart';

void main() => runApp(ListApp());

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
//  HomePage({Key key, this.title}) : super(key: key);
//  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  List<String> _list = ["0", "1", "2"];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle()
      ),

      body: _buildList(),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('chBox'),
          Text('Select all'),
          Text('all count'),
        ]
    );
  }

  Widget _buildList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _list.length * 2 - 1,
        itemBuilder: (context, i){
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          return _buildItem(_list[index]);
        }
    );
  }

  Widget _buildItem(String list) {
    return Column(
      children: <Widget>[
        ListTile(
            title: Text(list)
        ),

      ],
    );
  }

}
