import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  final String itemText;

  ItemList(this.itemText, {Key key}) : assert(itemText != null), super(key: key);

  @override
  _ItemListState createState() => _ItemListState(itemText);
}

class _ItemListState extends State<ItemList>{
  final String _itemText;
  bool _valueCb = false;
  int _counter = 0;

  _ItemListState(this._itemText);

  void _valueCbChanged(bool value) {
    setState(() {
      _valueCb = value;
    });
  }

  void _addCount(bool add) {
    setState(() {
      if (add) {
        _counter++;
      } else {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Checkbox(value: _valueCb, onChanged: _valueCbChanged),
        Text(_itemText),
        _buildCount(),
      ],
    );
  }

  Widget _buildCount() {
    return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FloatingActionButton(
            onPressed: () => _addCount(false),
            child: const Icon(Icons.remove),
            backgroundColor: Colors.lightBlueAccent,
            mini: true,
          ),
          Text(_counter.toString(), style: Theme.of(context).textTheme.title),
          FloatingActionButton(
            onPressed: () => _addCount(true),
            child: const Icon(Icons.add),
            backgroundColor: Colors.lightBlueAccent,
            mini: true,
          ),
    ]);
  }


}