import 'package:flutter/material.dart';

class DialogueBox {
  information(BuildContext context, String title, String description) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            title: Text(title),
            content: Text(description),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          //color: Colors.blue,
        );
      },
    );
  }
}
