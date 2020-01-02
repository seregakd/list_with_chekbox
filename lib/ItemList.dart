import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'ItemModel.dart';

class ItemList extends StatelessWidget  {
//  final String itemText;
//  final bool valueCb;
//  final int counter;
  final ItemModel itemModel;
  final int listItemNumber;
  final Function parentCount;
  final Function parentCb;

//  ItemList( {Key key, this.itemText, this.valueCb, this.counter,
//    @required this.parentCount, @required this.parentCb}) :  super(key: key);

  ItemList({Key key, this.itemModel, this.listItemNumber,
    @required this.parentCount, @required this.parentCb}) :  super(key: key);

  void _valueCbChanged(bool value) {
    parentCb(listItemNumber, value);
  }

  void _incrementCounter(bool value) {
    parentCount(listItemNumber, value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Checkbox(value: itemModel.valueCb, onChanged: _valueCbChanged),
        Text(itemModel.itemText),
        _buildCount(),
      ],
    );
  }

  Widget _buildCount() {
    return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FloatingActionButton(
            onPressed: () => _incrementCounter(false),
            child: const Icon(Icons.remove),
            backgroundColor: Colors.lightBlueAccent,
            mini: true,
          ),
          Text(itemModel.counter.toString()),  //, style: Theme.of(context).textTheme.title),
          FloatingActionButton(
            onPressed: () => _incrementCounter(true),
            child: const Icon(Icons.add),
            backgroundColor: Colors.lightBlueAccent,
            mini: true,
          ),
    ]);
  }

}
