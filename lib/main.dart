import 'package:flutter/material.dart';
import 'package:list_with_chekbox/ItemList.dart';
import 'dart:developer' as developer;

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
//  List<bool> _list2 = [];
  bool _valueTitleCb = false;

  void _addItem() {
    setState(() {
      _list.add("Item " + (_counter++).toString());
//      _list2.add(false);
    });
  }

  void _valueTitleCbChanged(bool value) {
      setState(() {
        _valueTitleCb = value;
      });

      /*
      for (int i = 0; i < _list2.length; i++){
        setState(() {
          _list2[i] = value;
        });
      */
//        developer.log('data:' + _list2[i].toString() , name: 'app.log');
   //   }
  }

  void refreshAllCount(dynamic changeChildCount) {
    setState(() {
      _allCount += changeChildCount;
    });
  }

  void refreshCb(dynamic childCount) {
    setState(() {
      _allCount += childCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle()
      ),

//      body: _buildList(),
      body: newList(list: _list, valueTitleCb: _valueTitleCb,
          parentCount: refreshAllCount, parentCb: refreshCb),

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
        return ItemList(itemText: _list[i], valueTitleCb: _valueTitleCb,
            parentCount: refreshAllCount, parentCb: refreshCb);
        }
    );
  }
}

class newList extends StatefulWidget {
  final List<String> list;
  final bool valueTitleCb;
  final Function parentCount;
  final Function parentCb;

  newList( {Key key, this.list, this.valueTitleCb,
    @required this.parentCount, @required this.parentCb}) : assert(list != null), super(key: key);

  @override
  _newListState createState() => _newListState(list, valueTitleCb, parentCount, parentCb);
}

class _newListState extends State<newList>{
  List<String> _list;
  bool _valueCb;
  Function parentCount;
  Function parentCb;

  _newListState(this._list, this._valueCb, this.parentCount, this.parentCb);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _list.length,
        itemBuilder: (context, i){
          return ItemList(itemText: _list[i], valueTitleCb: _valueCb,
              parentCount: parentCount, parentCb: parentCb);
        }
    );
  }


}


