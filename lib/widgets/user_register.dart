import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/login_form.dart';
import 'package:flutter_app/app_screens/rest_apis.dart';
import 'package:flutter_app/models/user_register_model.dart';

class UserRegisterWidget extends StatefulWidget {
  @override
  UserRegWidgetState createState() => UserRegWidgetState();
}

class UserRegWidgetState extends State<UserRegisterWidget> {
  TextEditingController companyname = new TextEditingController();
  TextEditingController companyemail = new TextEditingController();
  TextEditingController companyaddress = new TextEditingController();
  TextEditingController companymobile = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController useremail = new TextEditingController();
  TextEditingController useraddress = new TextEditingController();
  TextEditingController usermobile = new TextEditingController();
  TextEditingController usercountry = new TextEditingController();
  TextEditingController userpassword = new TextEditingController();
  final regFormkey = GlobalKey<FormState>();
  final userFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User Register Form!",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Enter Company Details'),
        ),
        body: new Form(
          // margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          key: regFormkey,
          child: ListView(
            children: <Widget>[
              new TextFormField(
                controller: companyname,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: "Company Name",
                    labelText: "Company Name"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter compnay name';
                  }
                  return null;
                },
              ),
              new TextFormField(
                controller: companyemail,
                decoration: InputDecoration(
                    hintText: "Company Email", labelText: "Company Email"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter compnay email';
                  }
                  return null;
                },
              ),
              new TextFormField(
                controller: companymobile,
                decoration: InputDecoration(
                    hintText: "Company Mobile", labelText: "Company Mobile"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter compnay mobile number';
                  }
                  return null;
                },
              ),
              new TextFormField(
                controller: companyaddress,
                decoration: InputDecoration(
                    hintText: "Company Address", labelText: "Company Address"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter compnay address';
                  }
                  return null;
                },
              ),
              new RaisedButton(
                onPressed: () async {
                  if (regFormkey.currentState.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text('Enter User Details'),
                        ),
                        body: new Form(
                          // margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                          key: userFormkey,
                          child: ListView(
                            children: <Widget>[
                              new TextFormField(
                                controller: username,
                                decoration: InputDecoration(
                                    hintText: "User Name",
                                    labelText: "User Name"),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Enter user name';
                                  }
                                  return null;
                                },
                              ),
                              new TextFormField(
                                controller: useremail,
                                decoration: InputDecoration(
                                    hintText: "User Email",
                                    labelText: "User Email"),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Enter user email';
                                  }
                                  return null;
                                },
                              ),
                              new TextFormField(
                                controller: usermobile,
                                decoration: InputDecoration(
                                    hintText: "User Mobile",
                                    labelText: "User Mobile"),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Enter user mobile number';
                                  }
                                  return null;
                                },
                              ),
                              new TextFormField(
                                controller: useraddress,
                                decoration: InputDecoration(
                                    hintText: "User Address",
                                    labelText: "User Address"),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Enter user address';
                                  }
                                  return null;
                                },
                              ),
                              new TextFormField(
                                controller: usercountry,
                                decoration: InputDecoration(
                                    hintText: "User Country",
                                    labelText: "User Country"),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Enter user country';
                                  }
                                  return null;
                                },
                              ),
                              new TextFormField(
                                controller: userpassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "User Password",
                                    labelText: "User Password"),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Enter password';
                                  }
                                  return null;
                                },
                              ),
                              new ButtonTheme(
                                // minWidth: 16.0,
                                // height: 30.0,
                                child: RaisedButton(
                                  onPressed: () async {
                                    if (userFormkey.currentState.validate()) {
                                      UserRegister userReg = new UserRegister(
                                          company_name: companyname.text,
                                          company_email: companyemail.text,
                                          company_mobile: companymobile.text,
                                          company_address: companyaddress.text,
                                          user_name: username.text,
                                          user_email: useremail.text,
                                          user_mobile: usermobile.text,
                                          user_address: useraddress.text,
                                          user_country: usercountry.text,
                                          user_password: userpassword.text);
                                      RestApis()
                                          .createUser(userReg)
                                          .then((msg) {
                                        print(
                                            'Return data :: ' + msg.toString());
                                        showAlert(context, msg['status'],
                                            msg['message']);
                                      });
                                    }
                                  },
                                  child: const Text(
                                    'Create User',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }));
                  }
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoSlab',
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showAlert(
      BuildContext context, String status, String message) {
    return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        if (status == "0") {
          return AlertDialog(
            title: Text(
              ' Success!',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            content: Text(
              message,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  // Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginForm(),
                    ),
                  );
                },
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: Text(
              ' Failed!',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            content: Text(
              message,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
      },
    );
  }
}
