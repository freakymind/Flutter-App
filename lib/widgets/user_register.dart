import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app_screens/login_form.dart';
import 'package:flutter_app/app_screens/rest_apis.dart';
import 'package:flutter_app/models/user_register_model.dart';
import 'package:validators/validators.dart';

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
          key: regFormkey,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 0.0, left: 25.0, right: 25.0, bottom: 0.0),
                color: Colors.white,
                child: new TextFormField(
                  controller: companyname,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "Company Name",
                      labelText: "Company Name"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter compnay name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0.0, left: 25.0, right: 25.0, bottom: 0.0),
                child: new TextFormField(
                  controller: companyemail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.contact_mail,
                        color: Colors.black,
                      ),
                      hintText: "Company Email",
                      labelText: "Company Email"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter compnay email';
                    }
                    //  else if (!isEmail(value)) {
                    //   return 'Enter a valid email';
                    // }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0.0, left: 25.0, right: 25.0, bottom: 0.0),
                child: new TextFormField(
                  controller: companymobile,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.contact_phone,
                        color: Colors.black,
                      ),
                      hintText: "Company Mobile",
                      labelText: "Company Mobile"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter compnay mobile number';
                    } else if (value.length < 10 || value.length > 10) {
                      return 'Enter valid mobile number';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0.0, left: 25.0, right: 25.0, bottom: 0.0),
                child: new TextFormField(
                  controller: companyaddress,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      hintText: "Company Address",
                      labelText: "Company Address"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter compnay address';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: 0.0, left: 155.0, right: 155.0, bottom: 0.0),
                  child: RaisedButton(
                    onPressed: () async {
                      if (regFormkey.currentState.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: Text('Enter User Details'),
                            ),
                            body: new Form(
                              key: userFormkey,
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 25.0,
                                        right: 25.0,
                                        bottom: 0.0),
                                    child: new TextFormField(
                                      controller: username,
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.person,
                                            color: Colors.black,
                                          ),
                                          hintText: "User Name",
                                          labelText: "User Name"),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter user name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 25.0,
                                        right: 25.0,
                                        bottom: 0.0),
                                    child: new TextFormField(
                                      controller: useremail,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.contact_mail,
                                            color: Colors.black,
                                          ),
                                          hintText: "User Email",
                                          labelText: "User Email"),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter user email';
                                        }

                                        // else if (!isEmail(value)) {
                                        //   return 'Enter a valid email';
                                        // }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 25.0,
                                        right: 25.0,
                                        bottom: 0.0),
                                    child: new TextFormField(
                                      controller: usermobile,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: <TextInputFormatter>[
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.phone_android,
                                            color: Colors.black,
                                          ),
                                          hintText: "User Mobile",
                                          labelText: "User Mobile"),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter user mobile number';
                                        } else if (value.length < 10 ||
                                            value.length > 10) {
                                          return 'Enter valid mobile number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 25.0,
                                        right: 25.0,
                                        bottom: 0.0),
                                    child: new TextFormField(
                                      controller: useraddress,
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.home,
                                            color: Colors.black,
                                          ),
                                          hintText: "User Address",
                                          labelText: "User Address"),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter user address';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 25.0,
                                        right: 25.0,
                                        bottom: 0.0),
                                    child: new TextFormField(
                                      controller: usercountry,
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.location_city,
                                            color: Colors.black,
                                          ),
                                          hintText: "User Country",
                                          labelText: "User Country"),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter user country';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 25.0,
                                        right: 25.0,
                                        bottom: 0.0),
                                    child: new TextFormField(
                                      controller: userpassword,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.black,
                                          ),
                                          hintText: "User Password",
                                          labelText: "User Password"),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter password';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 120.0,
                                        right: 120.0,
                                        bottom: 0.0),
                                    child: RaisedButton(
                                      onPressed: () async {
                                        if (userFormkey.currentState
                                            .validate()) {
                                          UserRegister userReg =
                                              new UserRegister(
                                                  companyname: companyname.text,
                                                  companyemail:
                                                      companyemail.text,
                                                  companymobile:
                                                      companymobile.text,
                                                  companyaddress:
                                                      companyaddress.text,
                                                  username: username.text,
                                                  useremail: useremail.text,
                                                  usermobile: usermobile.text,
                                                  useraddress: useraddress.text,
                                                  usercountry: usercountry.text,
                                                  userpassword:
                                                      userpassword.text);
                                          RestApis()
                                              .createUser(userReg)
                                              .then((msg) {
                                            // print('Return data :: '+ msg.toString());
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
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Colors.orangeAccent,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0),
                                      ),
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
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.orangeAccent,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  )),
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
