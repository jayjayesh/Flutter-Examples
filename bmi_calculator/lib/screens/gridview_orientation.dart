import 'package:flutter/material.dart';

class GridViewOrientation extends StatelessWidget {

  List<int> joinTwoArrayWithoutSpreadOperator(){
	var arr = [1,2,3];
	var anotherArr = [4,5,6];
	
	arr.addAll(anotherArr);
	return arr;
}

List<int> joinTwoArrayWithSpreadOperator(){
	var arr = [1,2,3];
	var anotherArr = [4,5,6];
	
	return [...arr, ...anotherArr];
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portrait-Landscape'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientationn) {
          return Container(
            child: GridView.count(
              crossAxisCount: orientationn == Orientation.portrait ? 2 : 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: List.generate(20, (index) {
                return Card(
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
