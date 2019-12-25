import 'package:flutter/material.dart';
import 'package:list_with_chekbox/ItemList.dart';

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
  int _allCount = 0;
  List<String> _list = [];
  bool _valueTitleCb = false;

  void _addItem() {
    setState(() {
      _list.add((_counter++).toString());
    });
  }

  void _valueTitleCbChanged(bool value) {
    setState(() {
      _valueTitleCb = value;
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
        tooltip: 'Add item in list',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Checkbox(value: _valueTitleCb, onChanged: _valueTitleCbChanged),
            Text('Select all'),
          ]),
          Text(_allCount.toString()),
        ]
    );
  }

  Widget _buildList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _list.length,
        itemBuilder: (context, i){
//            return _buildItem(_list[i]);
        return ItemList(_list[i], _valueTitleCb);

        }
    );
  }
}