import 'package:day_07_03_ui_table_view_load_more/Components/AlertDialogForDismissCell.dart';
import 'package:flutter/material.dart';

List<String> listItems = [
  "Hello",
  "World",
  "Flutter",
  "Community"
]; //dummy list of items

class TableViewDismissWithAlert extends StatefulWidget {
  static const routeName = 'TableViewDismissWithAlert';
  createState() => TableViewDismissWithAlertState();
}

class TableViewDismissWithAlertState extends State<TableViewDismissWithAlert> {
  void deleteItem(index) {
    /*
    By implementing this method, it ensures that upon being dismissed from our widget tree, 
    the item is removed from our list of items and our list is updated, hence
    preventing the "Dismissed widget still in widget tree error" when we reload.
    */
    setState(() {
      listItems.removeAt(index);
    });
  }

  void undoDeletion(index, item) {
    /*
    This method accepts the parameters index and item and re-inserts the {item} at
    index {index}
    */
    setState(() {
      listItems.insert(index, item);
    });
  }

  Widget cellBackgroudWhenSwipeToDelete() {
    return Container(
      //alignment: Alignment.centerRight,
      //padding: EdgeInsets.only(right: 20.0),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismiss with Alert'),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: cellBackgroudWhenSwipeToDelete(),
            key: ObjectKey(listItems[index]),
            direction: DismissDirection.startToEnd,
            child: ListTile(
              title: Text(listItems[index]),
            ),
            confirmDismiss: (direction) async {
              final alertResult = await showDialog(
                  context: context,
                  builder: (_) => AlertDialogForDismissCell(
                        actionName: 'delete',
                      ));

              return alertResult;
            },
            onDismissed: (direction) {
              var item = listItems.elementAt(index);
              //To delete
              deleteItem(index);
              //To show a snackbar with the UNDO button
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Item deleted"),
                  action: SnackBarAction(
                      label: "UNDO",
                      onPressed: () {
                        //To undo deletion
                        undoDeletion(index, item);
                      })));
            },
          );
        },
      )),
    );
  }
}
