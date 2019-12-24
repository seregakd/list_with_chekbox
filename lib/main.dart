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
        tooltip: 'Increment',
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
          Text('10'),
        ]
    );
  }

  Widget _buildList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _list.length,
        itemBuilder: (context, i){
//            return _buildItem(_list[i]);
        return ItemList(_list[i]);

        }
    );
  }

  /*
  Widget _buildItem(String list) {
    return Column(
//      children: [
      children: <Widget>[
        ListTile(
          leading:  Checkbox(value: _valueTitleCb, onChanged: _valueTitleCbChanged),
          title: Text(list),
          trailing: Icon(Icons.more_vert),
        ),
      ],
    );
  }
*/
}


class ItemList extends StatefulWidget {
  final String itemText;

  ItemList(this.itemText, {Key key}) : assert(itemText != null), super(key: key);

  @override
  _ItemListState createState() => _ItemListState(itemText);
}

class _ItemListState extends State<ItemList>{
  final String itemText;
  _ItemListState(@required this.itemText);

  //widget.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
//          leading:  Checkbox(value: _valueTitleCb, onChanged: _valueTitleCbChanged),
          title: Text(itemText),
          trailing: Icon(Icons.more_vert),
        ),
      ],
    );

  }
}