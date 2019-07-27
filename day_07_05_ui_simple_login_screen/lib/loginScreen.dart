import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextStyle _textStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final InputDecoration _inputDecorationEmail = InputDecoration(
      labelText: 'Email', hintText: 'Email', border: OutlineInputBorder());
  final InputDecoration _inputDecorationPassword = InputDecoration(
      labelText: 'Password',
      hintText: 'Password',
      border: OutlineInputBorder());
  double _nSizeBoxHeight = 15.0;
  double _nMaterialButtonMinWidth = 190.0;

  var _textfieldControllerEmail = TextEditingController();
  var _textfieldControllerPassword = TextEditingController();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  _textfieldChangeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: 140,
                ),
                SizedBox(
                  height: _nSizeBoxHeight,
                ),
                TextFormField(
                  controller: _textfieldControllerEmail,
                  focusNode: _focusNodeEmail,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (term) {
                    _textfieldChangeFocus(
                        context, _focusNodeEmail, _focusNodePassword);
                  },
                  decoration: _inputDecorationEmail,
                ),
                SizedBox(
                  height: _nSizeBoxHeight,
                ),
                TextFormField(
                  controller: _textfieldControllerPassword,
                  focusNode: _focusNodePassword,
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (term) {
                    _focusNodePassword.unfocus();
                  },
                  decoration: _inputDecorationPassword,
                ),
                SizedBox(
                  height: _nSizeBoxHeight,
                ),
                MaterialButton(
                  color: Colors.red,
                  minWidth: _nMaterialButtonMinWidth,
                  child: Text(
                    'Google',
                    style: _textStyle,
                  ),
                  onPressed: () {},
                ),
                MaterialButton(
                  color: Colors.blue,
                  minWidth: _nMaterialButtonMinWidth,
                  child: Text(
                    'Facebook',
                    style: _textStyle,
                  ),
                  onPressed: () {},
                ),
                MaterialButton(
                  color: Colors.orange,
                  minWidth: _nMaterialButtonMinWidth,
                  child: Text(
                    'Email',
                    style: _textStyle,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
