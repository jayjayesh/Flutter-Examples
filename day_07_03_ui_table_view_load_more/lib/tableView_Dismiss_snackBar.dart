import 'package:flutter/material.dart';

List<String> listItems = [
  "Hello",
  "World",
  "Flutter",
  "Community"
]; //dummy list of items

class TableViewDismissWithSnackBar extends StatefulWidget {
  static const routeName = 'TableViewDismissWithSnackBar';
  createState() => TableViewDismissWithSnackBarState();
}

class TableViewDismissWithSnackBarState
    extends State<TableViewDismissWithSnackBar> {
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
        title: Text('Dismiss with SnackBar'),
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
