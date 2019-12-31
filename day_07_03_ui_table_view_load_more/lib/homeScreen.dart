import 'package:day_07_03_ui_table_view_load_more/tableView_Dismiss_Alert.dart';
import 'package:day_07_03_ui_table_view_load_more/tableView_Dismiss_snackBar.dart';
import 'package:day_07_03_ui_table_view_load_more/tableView_Load_More.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'HomeScreen';

  void pushToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        {
          Navigator.pushNamed(context, TableViewLoadMoreScreen.routeName);
        }
        break;
      case 1:
        {
          Navigator.pushNamed(context, TableViewDismissWithAlert.routeName);
        }
        break;
      case 2:
        {
          Navigator.pushNamed(context, TableViewDismissWithSnackBar.routeName);
        }
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> allItems = [
      'TableView Load More',
      'Tableview Dismiss Row with Alert (ask before deleteing)',
      'Tableview Dismiss Row with SnackBar (show after deleting)',
    ];

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
                    pushToScreen(context, index);
                  },
                ),
              );
            },
          ),
        ));
  }
}
