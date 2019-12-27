import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ItemList extends StatefulWidget {
  final String itemText;
  final bool valueTitleCb;
  final Function notifyParent;

  ItemList(this.itemText, this.valueTitleCb, {Key key, @required this.notifyParent}) : assert(itemText != null), super(key: key);

  @override
  _ItemListState createState() => _ItemListState(itemText, valueTitleCb);
}

class _ItemListState extends State<ItemList>{
  final String _itemText;
  final bool _valueTitleCb;

  bool _valueCb;
  int _counter = 0;

  _ItemListState(this._itemText, this._valueTitleCb);

  @override
  void initState() {
    _valueCb = _valueTitleCb;
//    setState(() {});
    super.initState();
  }

  void _valueCbChanged(bool value) {
    setState(() {
      _valueCb = value;
    });
  }

  void _addCount(bool add) {
    setState(() {
      if (add) {
        _counter++;
        if (_valueCb) {
          widget.notifyParent(1);
        }
      } else {
        _counter--;
        if (_valueCb) {
          widget.notifyParent(-1);
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