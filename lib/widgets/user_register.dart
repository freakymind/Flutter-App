import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    print('User Widget page !');
    return MaterialApp(
      title: "User Register Form!",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Enter Company Details'),
        ),
        body: new Container(
          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              new TextField(
                controller: companyname,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: "Company Name",
                    labelText: "Company Name"),
              ),
              new TextField(
                controller: companyemail,
                decoration: InputDecoration(
                    hintText: "Company Email", labelText: "Company Email"),
              ),
              new TextField(
                controller: companymobile,
                decoration: InputDecoration(
                    hintText: "Company Mobile", labelText: "Company Mobile"),
              ),
              new TextField(
                controller: companyaddress,
                decoration: InputDecoration(
                    hintText: "Company Address", labelText: "Company Address"),
              ),
              new RaisedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text('Enter User Details'),
                      ),
                      body: new Container(
                        
                        margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: ListView(
                          children: <Widget>[
                            new TextField(
                              controller: username,
                              decoration: InputDecoration(
                                  hintText: "User Name",
                                  labelText: "User Name"),
                            ),
                            new TextField(
                              controller: useremail,
                              decoration: InputDecoration(
                                  hintText: "User Email",
                                  labelText: "User Email"),
                            ),
                            new TextField(
                              controller: usermobile,
                              decoration: InputDecoration(
                                  hintText: "User Mobile",
                                  labelText: "User Mobile"),
                            ),
                            new TextField(
                              controller: useraddress,
                              decoration: InputDecoration(
                                  hintText: "User Address",
                                  labelText: "User Address"),
                            ),
                            new TextField(
                              controller: usercountry,
                              decoration: InputDecoration(
                                  hintText: "User Country",
                                  labelText: "User Country"),
                            ),
                            new TextField(
                              controller: userpassword,
                              decoration: InputDecoration(
                                  hintText: "User Password",
                                  labelText: "User Password"),
                            ),
                            new ButtonTheme(
                              // minWidth: 16.0,
                              // height: 30.0,
                              child: RaisedButton(
                                onPressed: () async {
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

                                  UserRegister user =
                                      await RestApis().createUser(userReg);
                                  print('User Name : ' + user.user_name);
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
}
