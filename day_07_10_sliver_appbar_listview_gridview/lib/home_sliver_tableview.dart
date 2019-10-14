import 'package:flutter/material.dart';

class HomeSliverTableview extends StatefulWidget {
  @override
  _HomeSliverTableviewState createState() => _HomeSliverTableviewState();
}

class _HomeSliverTableviewState extends State<HomeSliverTableview> {
  var _urlNetworkImage =
      "https://www.linuxfoundation.org/wp-content/uploads/2016/12/lf_background_trees.jpg";

  Widget  getWidgetToFillRemaingSpace1(){
    return SliverList(

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
              title: Text("News Article"),
              background: Image.network(
                _urlNetworkImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
