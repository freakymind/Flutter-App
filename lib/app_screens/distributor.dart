import 'package:flutter/material.dart';
import '../models/distributor_model.dart';
import '../widgets/dialogueBox.dart';

class DistributorForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<DistributorForm> {
  String _name;
  String _email;
  String _mobile;
  String _country;
  String _address;
  var resultData;
  var  postRequest;
  DialogueBox dialogueBox = DialogueBox();
  List<String> data = ["India", "U.S", "U.K"];
  String dropdownValue = "India";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Color(0xffffffff),
          filled: true,
          labelText: "Distributor Name",
          labelStyle: TextStyle(
            color: Color(0xFFbdc6cf),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Color(0xffffffff),
              width: 0,
            ),
          )),
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return "name is required";
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      maxLength: 25,
      decoration: InputDecoration(
          fillColor: Color(0xffffffff),
          filled: true,
          labelText: "Email Address",
          labelStyle: TextStyle(
            color: Color(0xFFbdc6cf),
            fontSize: 22,
            // fontWeight: FontWeight.w900,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Color(0xffffffff),
              width: 0,
            ),
          )),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return "email is required";
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildMobileField() {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Color(0xffffffff),
          filled: true,
          labelText: "Mobile Number",
          labelStyle: TextStyle(
            color: Color(0xFFbdc6cf),
            fontSize: 22,
            // fontWeight: FontWeight.w900,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Color(0xffffffff),
              width: 0,
            ),
          )),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return "mobile Number is required";
        }
        return null;
      },
      onSaved: (String value) {
        _mobile = value;
      },
    );
  }

  Widget _buildCountryField() {
    return DropdownButtonFormField(
      value: dropdownValue,
      elevation: 2,
      isDense: true,
      items: data.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              height: 0,
            ),
          ),
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(() {
          print(newValue);
          dropdownValue = newValue;
          _country = newValue;
        });
      },
      onSaved: (String value) {
        _country = value;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelText: "Country",
        fillColor: Color(0xffffffff),
        filled: true,
        labelStyle: TextStyle(
          color: Color(0xFFbdc6cf),
          fontSize: 22,
          //fontWeight: FontWeight.w900,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildAddressField() {
    final maxLines = 5;
    return Container(
        height: maxLines * 24.0,
        child: TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            //border: InputBorder.none,
            fillColor: Color(0xffffffff),
            filled: true,
            labelText: "Address",
            labelStyle: TextStyle(
              color: Color(0xFFbdc6cf),
              fontSize: 22,
              //fontWeight: FontWeight.w900,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
            ),
            // errorText: addressController(_address.text),
          ),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.done,
          validator: (String value) {
            if (value.isEmpty) {
              return "address is required";
            }
            return null;
          },
          onSaved: (String value) {
            _address = value;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(width: 50, child: Icon(Icons.menu, color: Colors.white)),
            Text("Add New Distributor",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ],
        )),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
              key: _formKey,
              child:
                  ListView(scrollDirection: Axis.vertical, children: <Widget>[
                Container(
                    height: 500,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _buildNameField(),
                        _buildEmailField(),
                        _buildMobileField(),
                        _buildCountryField(),
                        _buildAddressField(),
                        //SizedBox(height:20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  if (!_formKey.currentState.validate()) {
                                    return;
                                  }
                                  _formKey.currentState.save();
                                  setState(() {
                                    print("name" + _name);
                                    print("email" + _email);
                                    print("address" + _address);
                                    print("country" + _country);
                                    PostRequest post = new PostRequest(name:_name,email:_email,mobile:_mobile,country:_country,address:_address,referenceBy:"kk@gmail.com");
                                    PostRequest.createRequest(body:post.toMap())
                                        .then((result) {
                                      postRequest = result;
                                      if(postRequest["status"] == 0) {
                                         dialogueBox.information(context,"SUCCESS",postRequest["message"]);
                                      } else {
                                         dialogueBox.information(context,"FAILED",postRequest["message"]);
                                      }
                                    });
                                  });
                                },
                                child: Text("Create Distributor",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                color: Colors.orange,
                                disabledColor: Colors.orange,
                              )
                            ])
                      ],
                    ))
              ])),
        ));
  }
}

class RequestBody {
  String name;
  String email;
  String mobile;
  RequestBody({this.name, this.email, this.mobile});
}
