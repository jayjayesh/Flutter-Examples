import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              radius: 50,
            ),
            Text(
              'Jayesh Lathiya',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'job title',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.normal,
                fontSize: 16,
                letterSpacing: 2.5,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Divider(
                color: Colors.grey,
                //indent: 50,
              ),
            ),
            InfoBox('test@test.com', Icons.email),
            InfoBox('123-456-789', Icons.phone)
          ],
        ),
      ),
    );
  }
} //StateLess HomeScreen Widget

//Create New Widget
class InfoBox extends StatelessWidget {
  final String strText;
  final IconData icIconData;
  //const InfoBox({Key key, this.strText, this.icIconData}):super(key:key);
  //const InfoBox({this.strText, this.icIconData});
  const InfoBox(this.strText, this.icIconData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Material(
        elevation: 10.0,
        child: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              icIconData,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              strText,
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
          ),
        ]),
      ),
    );
  }
}
