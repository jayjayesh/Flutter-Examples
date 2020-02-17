import 'package:day_17_01_sqlite_app/database/moor_database.dart';
import 'package:day_17_01_sqlite_app/widget/input_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildListView(context),
          ),
          InputBox(),
        ],
      ),
    );
  }

//--------- build method end here ------------------

  StreamBuilder<List<TaskTable>> _buildListView(BuildContext context) {
    //NOTE: Do not forget to set (listen: false) otherwise Provider will mesh-up Programe_counter, and code will no longer excecute further more
    final taskTableDaoObjc = Provider.of<TaskTableDao>(context, listen: false);

    return StreamBuilder(
      stream: taskTableDaoObjc.watchAllTasks(),
      //stream: taskTableDaoObjc.watchAllTasksWithOrder(),
      //stream: taskTableDaoObjc.watchAllTasksWithoutOrder(),
      builder: (BuildContext context, AsyncSnapshot<List<TaskTable>> snapshot) {
        final taskAllItem = snapshot.data ?? List();

        return ListView.separated(
            itemCount: taskAllItem.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (context, index) {
              final task = taskAllItem[index];
              return _buildListItem(task, taskTableDaoObjc);
            });
      },
    );
  }

  Widget _buildListItem(TaskTable taskObjc, TaskTableDao taskTableDaoObjc) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            taskTableDaoObjc.deleteTask(taskObjc);
          },
        ),
      ],
      child: CheckboxListTile(
          title: Text('${taskObjc.name}'),
          subtitle: Text(taskObjc.dueDate?.toString() ?? 'No date'),
          value: taskObjc.isDone,
          onChanged: (newValue) {
            taskTableDaoObjc.updateTask(taskObjc.copyWith(isDone: newValue));
          }),
    );
  }
}
