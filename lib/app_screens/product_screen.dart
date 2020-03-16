import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


class ProductScreen extends StatefulWidget{
  
  @override
  ProjectScreenState createState() =>ProjectScreenState();

  }

class ProjectScreenState extends State<ProductScreen>{

  String url = "http://192.168.2.237:3000/service/product";
  final _formKey = GlobalKey<FormState>();
  // final _product = Product();
  String selectedcountrycode;
  String selectedemodel;
  List<String> countrycode = <String>['india', 'uk', 'us', 'france'];
  List<String> model = <String>['a', 'b', 'c', 'd'];
  var productname;
  var brand;
  var dimensions;
  var countrycodevalue;
  var modelvalue;
  var weight;
  var batch;
  var batchsize;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
          appBar: AppBar(
            title: Text('Product'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                    accountName: Text('CompanyUserName'),
                    accountEmail: Text('LoginEmail'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Text('profilepic'),
                    ),),
                ListTile(
                  title: Text(
                    'ProductList',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () => {Navigator.of(context).pop()},
                  trailing: IconButton(
                      icon: Icon(Icons.arrow_forward), onPressed: () {},
                      // onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductList))}
                      ),
                ),
                ListTile(
                    title: Text('Company'),
                    onTap: () => {Navigator.of(context).pop()},
                    trailing: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () => {Navigator.pop(context)})),
                ListTile(
                    title: Text('Distributors'),
                    onTap: () => {Navigator.pop(context)},
                    trailing: IconButton(
                        icon: Icon(Icons.arrow_forward), onPressed: () {},
                        // onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductList))}
                        )),
                ListTile(
                  title: Text('Close'),
                  onTap: () => {Navigator.pop(context)},
                  trailing: IconButton(
                      icon: Icon(Icons.close),onPressed: () {},
                       // onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProductList))}
                      ),
                )
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(15.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'ProductName',
                            hintText: ' your product name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter product name';
                            } else if (value.length < 3) {
                              return 'please enter atleast 3 characters';
                            }
                             return null;
                          },
                          onSaved: (value) {
                            productname = value;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Brand',
                              hintText: 'Brand Name',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5)),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter brand';
                            }
                             return null;
                          },
                          onSaved: (value) {
                            brand = value;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Dimensions',
                              hintText: 'Dimensions',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5)),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter the dimensions of product';
                            } 
                            return null;
                          },
                          onSaved: (value) {
                            dimensions = value;
                          },
                        ),
                        SizedBox(height: 5),
                        DropdownButtonFormField(
                          value: selectedcountrycode,
                          decoration: InputDecoration(
                            labelText: 'CountryCode',
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          isDense: true,
                          isExpanded: true,
                          items: countrycode
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              selectedcountrycode = value;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please select one country';
                            }
                             return null;
                          },
                          onSaved: (value) {
                            countrycodevalue = value;
                          },
                        ),
                        SizedBox(height: 5),
                        DropdownButtonFormField(
                            value: selectedemodel,
                            decoration: InputDecoration(
                              labelText: 'Model',
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            items: model
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              setState(() {
                                selectedemodel = value;
                              });
                            },
                            onSaved: (value) {
                              modelvalue = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please select one model';
                              }
                               return null;
                            }),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Weight',
                              hintText: '10.25',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5)),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter the dimensions of product';
                            }
                             return null;
                          },
                          onSaved: (value) {
                            weight = value;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Batch',
                              hintText: '2020',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5)),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter the batch';
                            }
                             return null;
                          },
                          onSaved: (value) {
                            batch = value;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Batch Size',
                              hintText: '12',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5)),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter  batch size';
                            }
                             return null;
                          },
                          onSaved: (value) {
                            batchsize = value;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 150),
                          child: Center(
                            child: ButtonTheme(
                              minWidth: 200.0,
                              height: 35,
                              child: RaisedButton(
                                color: Colors.orangeAccent,
                                onPressed: () {
                                  final FormState form = _formKey.currentState;
                                  if (form.validate()) {
                                    form.save();

                                    saveProduct(
                                        productname,
                                        brand,
                                        dimensions,
                                        selectedcountrycode,
                                        selectedemodel,
                                        weight,
                                        batch,
                                        batchsize);

                                    createAlertDailog(context);
                                  }
                                },
                                child: Text("Save"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))),
          ),
          bottomNavigationBar:
              BottomNavigationBar(backgroundColor: Colors.blue, items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                title: Text(
                  'Favourite',
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.contacts,
                  color: Colors.white,
                ),
                title: Text('Contacts', style: TextStyle(color: Colors.black))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.mic_none,
                  color: Colors.white,
                ),
                title: Text('Recorder', style: TextStyle(color: Colors.black)))
          ]),
    
    );
  }
createAlertDailog(BuildContext context) {
    Widget okButton = FlatButton(
      color: Colors.orange,
      child: Text(
        "OK",
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Product'),
            content: Text('Product Created Successfully'),
            actions: <Widget>[
              okButton,
            ],
          );
        });
  }

  //http calls to save the product
  Future<http.Response> saveProduct(productname, brand, dimensions,
      selectedcountrycode, selectedemodel, weight, batch, batchsize) async {
    final http.Response response = await http.post(url,
        body: jsonEncode({
          "product_Name": productname,
          "brand": brand,
          "product_dimensions": dimensions,
          "company_Ref": "KEshavaTechSolut",
          "UPCA": "1455",
          "countrycode": countrycodevalue,
          "Weight": weight,
          "status": true,
          "created_on": DateTime.now().toString(),
          "updated_on": DateTime.now().toString()
        }));
    print(response);
    if (response.statusCode == 1) {
      return response;
    } else {
      throw Exception('Failed to create product.');
    }
  }
}

