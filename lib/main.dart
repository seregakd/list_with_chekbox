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
//  int counter = 0;
  int listItemNumber = 0;
//  List<String> _list = [];
  bool _valueTitleCb = false;
  List widgets = <Widget>[];
  List models = <ItemModel>[];
  ItemModel itemModel;

  void _addItem() {
    models.add(ItemModel(valueCb: _valueTitleCb,
        itemText: "Item " + (_nameCounter++).toString(), counter: 0));

    setState(() {
      widgets.add(ItemList(itemModel: models[models.length-1], listItemNumber: models.length-1,
          parentCount: refreshCount, parentCb: refreshCb));
    });
  }

  void _valueTitleCbChanged(bool value) {
    setState(() {
      _valueTitleCb = value;
    });

    for (int i = 0; i < models.length; i++){
      itemModel = models[i];

      if (itemModel.valueCb != value) {
        itemModel.valueCb = value;
        models[i] = itemModel;

        setState(() {
          widgets[i] = ItemList(itemModel: models[i], listItemNumber: i,
              parentCount: refreshCount, parentCb: refreshCb);
        });
      }
      print("i=" + i.toString() + ", Text=" + itemModel.itemText
          + ", valueTitleCb=" + itemModel.valueCb.toString()
          + ", counter=" + itemModel.counter.toString());
    }

  }

  void refreshCount(int i, bool childIncrement) {
    this.listItemNumber = listItemNumber;
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

      if (!itemModel.valueCb) {
        setState(() {
          _allCount--;
        });
      }
    }
    models[i] = itemModel;

    setState(() {
      widgets[i] = ItemList(itemModel: models[i], listItemNumber: i,
          parentCount: refreshCount, parentCb: refreshCb);
    });
  }

  void refreshCb(int i, bool childCb) {
    this.listItemNumber = i;
    itemModel = models[i];
    itemModel.valueCb = childCb;
    models[i] = itemModel;

    setState(() {
      widgets[i] = ItemList(itemModel: models[i], listItemNumber: i,
          parentCount: refreshCount, parentCb: refreshCb);
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
/*
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
*/
  Widget _buildList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widgets.length,
        itemBuilder: (context, i){
          return widgets[i];
        }
    );
  }
}



