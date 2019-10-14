import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  BuildContext _scaffoldContext;
  final TextStyle _textStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final InputDecoration _inputDecorationEmail = InputDecoration(
      labelText: "Email",
      hintText: "lathiyaJay@gmail.com",
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder());
  final InputDecoration _inputDecorationPassword = InputDecoration(
      labelText: "Password",
      hintText: "madhubani@paintings1947",
      hintStyle: TextStyle(color: Colors.grey),
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

  void _validateInputsFields() {
    var emailFieldError = validateEmailMethod(_textfieldControllerEmail.text);
    var passwordFieldError =
        validatePasswordMethod(_textfieldControllerPassword.text);

    if (emailFieldError != null) {
      Scaffold.of(_scaffoldContext).showSnackBar(SnackBar(
        content: Text(emailFieldError),
      ));
    } else if (passwordFieldError != null) {
      Scaffold.of(_scaffoldContext).showSnackBar(SnackBar(
        content: Text(passwordFieldError),
      ));
    } else {
      print('Email & Password correct : Go to Login screen');
      _focusNodeEmail.unfocus();
      _focusNodePassword.unfocus();
      Scaffold.of(_scaffoldContext).showSnackBar(SnackBar(
        content: Text('Login success'),
        backgroundColor: Colors.green,
      ));
    }
  }

  String validateNameMethod(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  String validatePasswordMethod(String value) {
    if (value.length < 4)
      return 'Password must be more than 3 charater';
    else
      return null;
  }

  String validateMobileMethod(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  String validateEmailMethod(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

//--------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: new Builder(builder: (BuildContext context) {
        _scaffoldContext = context;
        return Container(
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
                    keyboardType: TextInputType.emailAddress,
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
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (term) {
                      _focusNodePassword.unfocus();
                    },
                    obscureText: true,
                    decoration: _inputDecorationPassword,
                  ),
                  SizedBox(
                    height: _nSizeBoxHeight,
                  ),
                  MaterialButton(
                    height: 50,
                    color: Colors.blue,
                    minWidth: _nMaterialButtonMinWidth,
                    child: Text(
                      'Login',
                      style: _textStyle,
                    ),
                    onPressed: () {
                      _validateInputsFields();
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    color: Colors.red,
                    height: 40,
                    minWidth: _nMaterialButtonMinWidth,
                    child: Text(
                      'Google',
                      style: _textStyle,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  MaterialButton(
                    color: Colors.blue[900],
                    height: 40,
                    minWidth: _nMaterialButtonMinWidth,
                    child: Text(
                      'Facebook',
                      style: _textStyle,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
