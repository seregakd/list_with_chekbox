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
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  List<String> _list = [];

  void _addItem() {
    setState(() {
      _list.add((_counter++).toString());
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
        onPressed: _addItem,
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
        itemCount: _list.length,
        itemBuilder: (context, i){
            return _buildItem(_list[i]);
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
