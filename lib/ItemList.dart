import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ItemList extends StatefulWidget {
  final String itemText;
  final bool valueTitleCb;
  final Function parentCount;
  final Function parentCb;

  ItemList( {Key key, this.itemText, this.valueTitleCb,
    @required this.parentCount, @required this.parentCb}) : assert(itemText != null), super(key: key);

  @override
  _ItemListState createState() => _ItemListState(itemText);
}

class _ItemListState extends State<ItemList>{
  final String _itemText;
  bool _valueCb;
  int _counter = 0;

  _ItemListState(this._itemText);

  @override
  void initState() {
//    setState(() {});
//  print(_valueCb.toString());
    _valueCb = this.widget.valueTitleCb;
    super.initState();
  }

  void _valueCbChanged(bool value) {
    setState(() {
      _valueCb = value;
      if (_valueCb) {
        widget.parentCb(_counter);
      } else {
        widget.parentCb(-_counter);
      }
    });
  }

  void _addCount(bool add) {
    setState(() {
      if (add) {
        _counter++;
        if (_valueCb) {
          widget.parentCount(1);
        }
      } else {
        _counter--;
        if (_valueCb) {
          widget.parentCount(-1);
        }
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