import 'package:flutter/material.dart';

class AssignLot extends StatefulWidget {
  @override
  _AssignlotState createState() => _AssignlotState();
}

class _AssignlotState extends State<AssignLot> {
  final _formKey = GlobalKey<FormState>();

  String product;
  String distributor;
  String batch;
  List<String> products = ['Paracetmol', 'Dolo', 'Zindha'];
  List<String> distributors = ['Krishna', 'Yeswanth', 'Swathi'];
  List<String> batchnum=['2016','2017','2018','2019'];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('Assign LOT'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Builder(
              builder: (context) => Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      DropdownButtonFormField(
                        value: product,
                        decoration: InputDecoration(
                          labelText: 'Products',
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        isDense: true,
                        isExpanded: true,
                        items: products
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            product = value;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please select one country';
                          }
                        },
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                        value: batch,
                        decoration: InputDecoration(
                          labelText: 'Batch',
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        isDense: true,
                        isExpanded: true,
                        items: batchnum
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            batch = value;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please select one country';
                          }
                        },
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                            Text('OR'),
                            Expanded(
                                child: Divider(
                              color: Colors.black,
                            ))
                          ],
                        ),
                        
                      ),
                      SizedBox(
                        height: 10
                      ),

                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Enter Product Manually',
                          hintText: 'Paracetmol',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(5.0),
                        ),
                      ),
                      SizedBox(
                     height: 20,
                      ),
                       DropdownButtonFormField(
                        value: distributor,
                        decoration: InputDecoration(
                          labelText: 'Distributors',
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        isDense: true,
                        isExpanded: true,
                        items: distributors
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            distributor = value;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please select one country';
                          }
                        },
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 150),
                        child: Center(
                          child: ButtonTheme(
                            minWidth: 200,
                            height: 35,
                            child: RaisedButton(
                              color: Colors.orangeAccent,
                              onPressed: (){

                              },
                              child: Text('AssignLOT'),
                            ),
                            
                          ),
                        ) ,
                      )
                    ],
                  ))),
        ),
      );
   
  }
}
