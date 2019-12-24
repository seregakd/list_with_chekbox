import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  final String itemText;

  ItemList(this.itemText, {Key key}) : assert(itemText != null), super(key: key);

  @override
  _ItemListState createState() => _ItemListState(itemText);
}

class _ItemListState extends State<ItemList>{
  final String itemText;
  _ItemListState(this.itemText);

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