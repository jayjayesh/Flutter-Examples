import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeSliverTableview extends StatefulWidget {
  @override
  _HomeSliverTableviewState createState() => _HomeSliverTableviewState();
}

class _HomeSliverTableviewState extends State<HomeSliverTableview> {
  var _urlNetworkImage =
      "https://www.linuxfoundation.org/wp-content/uploads/2016/12/lf_background_trees.jpg";

  Widget getWidgetSliverFixedExtentList() {
    return SliverFixedExtentList(
      itemExtent: 80,
      delegate: SliverChildListDelegate([
        Container(
          color: Colors.red,
          child: Text("SliverFixedExtentList cell 1"),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(15.0),
        ),
        Container(
          color: Colors.green,
          child: Text("SliverFixedExtentList cell 2"),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(15.0),
        ),
        Container(
          color: Colors.blue,
          child: Text("SliverFixedExtentList cell 3"),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(15.0),
        ),
      ]),
    );
  }

  Widget getWidgetSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 50,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15.0),
            color: Colors.orange[100 * (index % 9)],
            child: Text("SliverList cell $index"),
          );
        },
        childCount:
            50, //!If removed this childCount = result = infinite TblView
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
            floating:
                false, // in the middle of scrollview when you pul down appBar apears, If it is true AppBar Title goes off screen
            pinned: true, // don't hide appbar complitly
            snap: false, //Shut on-off drasticly
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
                title: Text("News Article TableView"),
                background: CachedNetworkImage(
                  imageUrl: _urlNetworkImage,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
          ),
          getWidgetSliverFixedExtentList(), //SliverChildListDelegate = Listview  = Static Items
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Section Header",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          getWidgetSliverList(), //SliverChildBuilderDelegate  = ListView.Builder = Dynamic Items
        ],
      ),
    );
  }
}
