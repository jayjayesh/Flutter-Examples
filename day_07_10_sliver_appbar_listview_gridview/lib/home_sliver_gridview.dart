import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeSliverGridView extends StatefulWidget {
  @override
  _HomeSliverGridViewState createState() => _HomeSliverGridViewState();
}

class _HomeSliverGridViewState extends State<HomeSliverGridView> {
  var _urlNetworkImage =
      "https://www.linuxfoundation.org/wp-content/uploads/2016/12/lf_background_trees.jpg";
  var _urlAvatarImage = "https://i.pravatar.cc/302";
  var _urlAvatarImage_every_time_new = "https://i.pravatar.cc/150?img=5";
  

  void showImageLikeWhatsApp(int indexGridBox, String _urlAvatarImage) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false, //screen will be transparent
        pageBuilder: (BuildContext context, _, __) {
          return Material(
            color: Colors.black87,
            child: Container(
              padding: EdgeInsets.all(30),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Hero(
                  tag: indexGridBox,
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Container(
                      // child: CachedNetworkImage(
                      //   imageUrl: _urlAvatarImage,
                      //   placeholder: (context, url) =>
                      //       CircularProgressIndicator(),
                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      // ),
                      child: CachedNetworkImage(
                        imageUrl: _urlAvatarImage,
                        placeholder: (_, __) => Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }

  Widget getWidgetSliverGridView() {
    return SliverGrid(
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
      delegate: SliverChildBuilderDelegate(
        (context, indexGridBox) {
          return Container(
            //alignment: Alignment.center,
            //color: Colors.teal[100 * (index % 9)],
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
              // boxShadow: BoxShadow(
              //   color: Colors.black,
              //   offset: Offset(2, 2),
              //   spreadRadius: 2,
              //   blurRadius: 4,
              // ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: InkWell(
                child: Hero(
                  tag: indexGridBox,
                  child: CachedNetworkImage(
                    imageUrl: _urlAvatarImage,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                onTap: () {
                  showImageLikeWhatsApp(indexGridBox, _urlAvatarImage);
                },
              ),
            ),
          );
        },
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
              title: Text("GridView Title"),
              background: Image.network(
                _urlNetworkImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.orange,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Grid View Header",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            sliver: getWidgetSliverGridView(),
          ),
        ],
      ),
    );
  }
}
