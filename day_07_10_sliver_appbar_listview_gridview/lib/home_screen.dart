import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _urlNetworkImage =
      "https://www.linuxfoundation.org/wp-content/uploads/2016/12/lf_background_trees.jpg";

  Future<bool> _retryActionFutureMethodThatReturnBool() async {
    await Future.delayed(const Duration(seconds: 5));
    return true;
  }

  Widget getWidgetSliverFillRemaining() {
    return SliverFillRemaining(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "This (SliverFillRemaining widget) is (used for small content) (like error while getting data) (small paragrafe that does not fill whole screen)",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: _retryActionFutureMethodThatReturnBool(),
              builder: (context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasData) {
                  return RaisedButton(
                    child: Text("Retry"),
                    onPressed: () {},
                  );
                } else {
                  return CupertinoActivityIndicator();
                }
              },
            ),
          ],
        ),
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
              title: Text('Forest Article'),
              background: Image.network(
                _urlNetworkImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          getWidgetSliverFillRemaining(),
        ],
      ),
    );
  }
}
