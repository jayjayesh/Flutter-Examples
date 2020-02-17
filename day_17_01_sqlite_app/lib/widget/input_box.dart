import 'package:day_17_01_sqlite_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:day_17_01_sqlite_app/database/moor_database.dart';

class InputBox extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  DateTime newDate;
  TextEditingController txtController;

  @override
  void initState() {
    super.initState();
    txtController = TextEditingController();
  }

  @override
  void dispose() {
    txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey[700],
      child: Row(
        children: <Widget>[
          _buildTextField(context),
          _buildDateButton(context),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: txtController,
          decoration: Constants.inputDecorationNewTask,
          onSubmitted: (newTypedText) {
            //NOTE: Do not forget to set (listen: false) otherwise Provider will mesh-up Programe_counter, and code will no longer excecute further more
            final taskTableDaoObjc =
                Provider.of<TaskTableDao>(context, listen: false);
            final newTaskObjc = TaskTablesCompanion(
              name: Value(newTypedText),
              dueDate: Value(newDate),
            );
            taskTableDaoObjc.insertTask(newTaskObjc);
            resetValuesAfterSubmit();
          },
        ),
      ),
    );
  }

  Widget _buildDateButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () async {
        newDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2050),
        );
      },
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      newDate = null;
      txtController.clear();
    });
  }
}
