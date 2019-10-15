import 'package:flutter/material.dart';

class HomeSliverGridView extends StatefulWidget {
  @override
  _HomeSliverGridViewState createState() => _HomeSliverGridViewState();
}

class _HomeSliverGridViewState extends State<HomeSliverGridView> {
  var _urlNetworkImage =
      "https://www.linuxfoundation.org/wp-content/uploads/2016/12/lf_background_trees.jpg";
  var _urlAvatarImage = "https://i.pravatar.cc/300";

  Widget getWidgetSliverGridView() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: Image.network(
              _urlAvatarImage,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      //gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      // mainAxisSpacing: 20.0,
      // crossAxisSpacing: 10.0,
      // maxCrossAxisExtent: 200,
      // childAspectRatio: 1.0,
      //),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 10.0,
        //childAspectRatio: 1,
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
              title: Text("News Article GridView"),
              background: Image.network(
                _urlNetworkImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Grid ViewD Header",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          getWidgetSliverGridView(),
        ],
      ),
    );
  }
}
