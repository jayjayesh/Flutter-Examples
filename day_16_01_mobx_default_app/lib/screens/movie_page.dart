import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(height: 300, color: Colors.blue),
            Expanded(
              child: ListView.builder(
                  primary: false,
                  //shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
