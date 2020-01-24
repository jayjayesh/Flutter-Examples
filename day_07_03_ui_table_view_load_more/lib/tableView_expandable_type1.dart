import 'package:day_07_03_ui_table_view_load_more/models/expansion_tile_item.dart';
import 'package:flutter/material.dart';

class TableViewExpandableType1 extends StatefulWidget {
  static const routeName = 'TableViewExpandableType1';

  @override
  _TableViewExpandableType1State createState() =>
      _TableViewExpandableType1State();
}

class _TableViewExpandableType1State extends State<TableViewExpandableType1> {
  List<ExpansionTileItem> allItems = [
    ExpansionTileItem(title: 'iPhone', children: [
      ExpansionTileChildrenItem(title: 'iPhone 7'),
      ExpansionTileChildrenItem(title: 'iPhone 8'),
      ExpansionTileChildrenItem(title: 'iPhone X'),
      ExpansionTileChildrenItem(title: 'iPhone 11'),
    ]),
    ExpansionTileItem(
      title: 'iPad',
      children: [
        ExpansionTileChildrenItem(title: 'iPad Mini'),
        ExpansionTileChildrenItem(title: 'iPad Air'),
        ExpansionTileChildrenItem(title: 'iPad Pro'),
      ],
    ),
    ExpansionTileItem(
      title: 'Mac',
      children: [
        ExpansionTileChildrenItem(title: 'Mac mini'),
        ExpansionTileChildrenItem(title: 'iMac'),
        ExpansionTileChildrenItem(title: 'Macbook Air'),
        ExpansionTileChildrenItem(title: 'Macbook Pro')
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded TableView'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: allItems.length,
            itemBuilder: (_, index) {
              return Container(
                color: Colors.grey[200],
                child: ExpansionTile(
                  title: Text('${allItems[index].title}'),
                  children: allItems[index]
                      .children
                      .map((ExpansionTileChildrenItem childrenObjc) {
                    return Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('   ${childrenObjc.title}'),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
      ),
    );
  }
}
