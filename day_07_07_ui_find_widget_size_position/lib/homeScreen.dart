import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _cardKey = GlobalKey();
  Size _cardSize;
  Offset _cardPosition;

  @override
  void initState() {
    super.initState();

    //? This method called when viewDidLoad and all widgets frame are set.
    //? This Method called Once (while viewdidload  )
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSizeandPosition();
    });
  }

  getSizeandPosition() {
    RenderBox _cardBox = _cardKey.currentContext.findRenderObject();
    _cardSize = _cardBox.size;
    _cardPosition = _cardBox.localToGlobal(Offset.zero);
    //Reload data (reload widget)
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              key: _cardKey,
              color: Colors.blueGrey[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hi Jayesh",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Find Any Widget SIZE & POSITION",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "size : $_cardSize",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "position : $_cardPosition",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
