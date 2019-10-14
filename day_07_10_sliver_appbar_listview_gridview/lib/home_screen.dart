import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _urlNetworkImage =
      "https://www.linuxfoundation.org/wp-content/uploads/2016/12/lf_background_trees.jpg";

  Widget getWidgetToFillRemaingSpace1() {
    return SliverFillRemaining(
      child: Container(
        color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //https://api.flutter.dev/flutter/material/SliverAppBar-class.html
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Forest Article'),
              background: Image.network(
                _urlNetworkImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          getWidgetToFillRemaingSpace1(),
        ],
      ),
    );
  }
}
