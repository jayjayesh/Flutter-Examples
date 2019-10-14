import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomeScreenClass extends StatefulWidget {
  @override
  _HomeScreenClassState createState() => _HomeScreenClassState();
}

class _HomeScreenClassState extends State<HomeScreenClass> {
  TextEditingController textFieldController = TextEditingController();
  var strTypedName = '';
  var strPredictionResult = '';

  predictGender(String name) async {
    var urlPredictGender = 'https://api.genderize.io/?name=$name';

    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      var response = await http.get(urlPredictGender);
      var responseBodyDict = jsonDecode(response.body);

      setState(() {
        strPredictionResult =
            responseBodyDict['gender'] ?? 'Can\'t be determine';
      });
    } else {
      print('No internet :( Reason:');
      //print(DataConnectionChecker().lastTryResults);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('No Internet'),
              content: Text('Check your internet connection.'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Type here to predict Gender'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: textFieldController,
                  decoration: InputDecoration(
                    labelText: "Hi",
                    border: OutlineInputBorder(),
                    hintText: 'Jayesh',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  return RaisedButton(
                    child: Text('Predict'),
                    onPressed: () {
                      //To Hide Keyboard
                      //FocusScope.of(context).requestFocus(new FocusNode());
                      FocusScope.of(context).unfocus();

                      if (textFieldController.text.isEmpty) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Textfield is empty'),
                          duration: Duration(seconds: 3),
                        ));
                      } else {
                        predictGender(textFieldController.text);
                        setState(() {
                          strTypedName = textFieldController.text;
                        });
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              if (strPredictionResult != null)
                Text(strPredictionResult),
              //Text('Hi'),
            ],
          ),
        ),
      ),
    );
  }
}
