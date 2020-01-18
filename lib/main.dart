import 'package:flutter/material.dart';
import 'ItemList.dart';
import 'ItemModel.dart';

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
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _nameCounter = 0;
  int _allCount = 0;
  bool _valueTitleCb = false;
  List models = <ItemModel>[];
  ItemModel itemModel;

  void _addItem() {
    setState(() {
      models.add(ItemModel(valueCb: _valueTitleCb,
          itemText: "Item " + (_nameCounter++).toString(), counter: 0));
    });
  }

  void _valueTitleCbChanged(bool value) {
    setState(() {
      _valueTitleCb = value;
    });

    _allCount = 0;
    for (int i = 0; i < models.length; i++){
      itemModel = models[i];

      if (itemModel.valueCb != value) {
        itemModel.valueCb = value;

        setState(() {
          models[i] = itemModel;
        });
      }

      if (itemModel.valueCb) {
        _allCount += itemModel.counter;
      }
    }
  }

  void refreshCount(int i, bool childIncrement) {
    itemModel = models[i];

    if (childIncrement) {
      itemModel.counter++;

      if (itemModel.valueCb) {
        setState(() {
          _allCount++;
        });
      }
    } else {
      itemModel.counter--;

      if (itemModel.valueCb) {
        setState(() {
          _allCount--;
        });
      }
    }

    setState(() {
      models[i] = itemModel;
    });
  }

  void refreshCb(int i, bool childCb) {
    itemModel = models[i];
    itemModel.valueCb = childCb;

    setState(() {
      models[i] = itemModel;
    });

    if (childCb) {
      setState(() {
        _allCount += itemModel.counter;
      });
    } else {
      setState(() {
        _allCount -= itemModel.counter;
      });
    }
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
        itemCount: models.length,
        itemBuilder: (context, i){
        return ItemList(itemModel: models[i], listItemNumber: i,
          parentCount: refreshCount, parentCb: refreshCb);
        }
    );
  }
}



