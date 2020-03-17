import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/widgets/user_register.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './dashboard.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginState createState() {  
    return LoginState();
  }
}

class LoginState extends State<LoginForm> {
  String _email = "";
  String _password = "";

  final _emailCon = TextEditingController();
  final _passWdCon = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailCon.dispose();
    _passWdCon.dispose();
    super.dispose();
  }

  var _client = http.Client();
  //var _body = {};
  var _url = "http://" +
      DotEnv().env['NODE_IP_ADDRESS'] +
      ":" +
      DotEnv().env['PORT'] +
      "/service/login";
  Map<String, String> _headers = {"Content-type": "application/json"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      //resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 70.0, 0.0, 0.0),
                    child: LogoImage(),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 280.0, 0.0, 0.0),
                    child: Text('Simplifyng tech for better tomorrow',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.white)),
                  ),
                ],
              ),
            )),
            Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.only(
                  top: 10.0, left: 20.0, right: 20.0, bottom: 0.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _emailCon,
                    // onChanged: (newInput) {
                    //   setState(() {
                    //     _emailCon.text = newInput;
                    //   });
                    // },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    controller: _passWdCon,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    //color: Colors.blueAccent,
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(
                        top: 10.0, left: 200.0, right: 20.0, bottom: 0.0),
                    child: InkWell(
                        child: Text('Forget password',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline))),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.orangeAccent,
                        color: Colors.orangeAccent,
                        elevation: 6.0,
                        child: GestureDetector(
                            onTap: () async {
                              _email = _emailCon.text.toString();
                              _password = _passWdCon.text.toString();
                              try {
                                var uriRes = await authenticate(
                                    _email.trim(), _password.trim());

                                if (uriRes.statusCode == 200) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DashBoard(),
                                    ),
                                  );
                                } else {
                                  return LoginAlert(context);
                                }
                              } finally {
                                //_client.close();
                                _emailCon.clear();
                                _passWdCon.clear();
                                _emailCon.text = '';
                                _passWdCon.text = '';
                              }
                            },
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                            )),
                      )),
                  SizedBox(height: 15.0),
                  Container(
                    child: Center(
                        child: Text('Or',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0))),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child: Center(
                      child: Column(children: <Widget>[
                        InkWell(
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            //print();
                            //print();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => 
                               UserRegisterWidget()
                               ,
                              ),
                            );
                          },
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<http.Response> authenticate(userId, password) {
    var _body = {'user_id': userId, 'password': password};

    return _client.post(_url, headers: _headers, body: jsonEncode(_body));
  }

  void LoginAlert(BuildContext context) {
    var AlertDailog = AlertDialog(
      title: Text('Login Failed'),
      content: Text(
        'Something Went wrong',
        style: TextStyle(color: Colors.black, fontSize: 15.0),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDailog;
        });
  }
}

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/goPharma@4x.png');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
      height: 250.0,
      width: 200.0,
    );
  }
}

class Auth {
  String user_id = '';
  String password = '';

  Auth(this.user_id, this.password);

  Map<String, dynamic> tomap() {
    return <String, dynamic>{
      'user_id': user_id,
      'password': password,
    };
  }
}
