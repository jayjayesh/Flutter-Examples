import 'package:flutter/material.dart';

class LoginRegisterScreen extends StatelessWidget {
  bool isUserAlreadyLogin() {
    return false;
  }

  List<int> joinTwoArrayWithoutCascade() {
    var arr = [5, 4, 1, 2, 3];
    
    arr.sort(); // output = [1,2,3,4,5]
    arr.removeLast(); // output = [1,2,3,4]
    return arr;
  }

  List<int> joinTwoArrayWithCascade() {
    var arr = [5, 4, 1, 2, 3];

    return arr
      ..sort()
      ..removeLast();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('TextField : Email '),
          Text('TextField : Password'),
          if (isUserAlreadyLogin() == false) ...[
            RaisedButton(
              child: Text('Register'),
              onPressed: () {},
            )
          ],
          if (isUserAlreadyLogin() == true) ...[
            RaisedButton(
              child: Text('Login'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Forgot Password'),
              onPressed: () {},
            )
          ],
        ],
      ),
    );
  }
}
