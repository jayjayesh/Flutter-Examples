import 'package:day_07_03_ui_table_view_load_more/tableView_Dismiss_Alert.dart';
import 'package:day_07_03_ui_table_view_load_more/tableView_Dismiss_snackBar.dart';
import 'package:day_07_03_ui_table_view_load_more/tableView_Load_More.dart';
import 'package:day_07_03_ui_table_view_load_more/tableView_expandable_type1.dart';
import 'package:day_07_03_ui_table_view_load_more/tableView_expandable_type2.dart';
import 'package:flutter/material.dart';

const String TITLE_TABLEVIEW_LOAD_MORE = 'TableView Load More';
const String TITLE_TABLEVIEW_DISMISS_ROW_ALERT =
    'Tableview Dismiss Row with Alert (ask before deleteing)';
const String TITLE_TABLEVIEW_DISMISS_ROW_SNACKBAR =
    'Tableview Dismiss Row with SnackBar (show after deleting)';
const String TITLE_TABLEVIEW_EXPANDED_TYPE1 = 'Expandable TableView Type1';
const String TITLE_TABLEVIEW_EXPANDED_TYPE2 = 'Expandable TavleView Type2';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> allItems;

  Map<String, String> allItemsMap;

  @override
  Widget build(BuildContext context) {
    List<String> allItems = [
      TITLE_TABLEVIEW_LOAD_MORE,
      TITLE_TABLEVIEW_DISMISS_ROW_ALERT,
      TITLE_TABLEVIEW_DISMISS_ROW_SNACKBAR,
      TITLE_TABLEVIEW_EXPANDED_TYPE1,
      TITLE_TABLEVIEW_EXPANDED_TYPE2
    ];

    allItemsMap = {
      TITLE_TABLEVIEW_LOAD_MORE: TableViewLoadMoreScreen.routeName,
      TITLE_TABLEVIEW_DISMISS_ROW_ALERT: TableViewDismissWithAlert.routeName,
      TITLE_TABLEVIEW_DISMISS_ROW_SNACKBAR:
          TableViewDismissWithSnackBar.routeName,
      TITLE_TABLEVIEW_EXPANDED_TYPE1: TableViewExpandableType1.routeName,
      TITLE_TABLEVIEW_EXPANDED_TYPE2: TableViewExpandableType2.routeName
    };

    return Scaffold(
        appBar: AppBar(
          title: Text('TableView Types'),
        ),
        body: Container(
          //padding: EdgeInsets.only(left: 10.0),
          child: ListView.separated(
            itemCount: allItems.length,
            separatorBuilder: (_, __) {
              return Divider(
                height: 2.0,
                color: Colors.grey,
              );
            },
            itemBuilder: (context, index) {
              return SizedBox(
                height: 60.0,
                child: ListTile(
                  title: Text(allItems[index]),
                  onTap: () {
                    Navigator.pushNamed(context, allItemsMap[allItems[index]]);
                  },
                ),
              );
            },
          ),
        ));
  }
}
