// import 'package:flutter/material.dart';

// class DashBoard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {    
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//       ),
//       body: Container(
//           alignment: Alignment.center,
//           child: Column(
//             children: <Widget>[
//               Container(
//                 child: Text('Dashboard Under Development',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold)),
//               )
//             ],
//           )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/assignalot.dart';
import './product_screen.dart';
import './distributor.dart';
import './login_form.dart';

class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashBoardForm();
  }
}

class DashBoardForm extends State<DashBoard> {
  Widget _iconWidget(name, iconName, colorName,navigationForm) {
    return Container(
        child: Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => navigationForm),
                  );
                },
                child: Container(
                  width: 90,
                  height: 70,
                  color: Colors.white,
                  child: Icon(
                    iconName,
                    color: colorName,
                    size: 40,
                  ),
                )),
            FlatButton(
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => navigationForm),
                  );
                },
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ))
          ],
        )
      ],
    ));
  }

  Widget _positionwidget() {
    return Positioned(
        top: 200.0,
        left: 0.5,
        right: 0.5,
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _iconWidget("Assign LOT", Icons.account_box, Colors.blueAccent,AssignLot()),
            _iconWidget("Add Distributor", Icons.person_add, Colors.redAccent,DistributorForm()),
            _iconWidget("Add Product", Icons.playlist_add, Colors.orangeAccent,ProductScreen())
          ],
        )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(width:50, child: Icon(Icons.menu, color: Colors.white)),
            Text("Dashboard",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              margin: EdgeInsets.only(left:130),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child:IconButton(icon:Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24.0,                                       
                    ),
                    onPressed: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  ),)
                 
                  )
                ],
              ),
              width: 50,
            ),
          ],
        ),
        //leading: new Container(),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
                height: 250,
                //color: Colors.blueGrey,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orangeAccent, Colors.blue]),
                ),
                child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://pngimage.net/wp-content/uploads/2018/05/admin-logo-png-6.png")))),
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    // width:200,
                                    child: Text("Krishna Kanth",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900))),
                                Container(
                                    // width:100,
                                    child: Text(
                                  "ADMIN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.right,
                                ))
                              ],
                            ))
                      ],
                    ))),
            Container(),
            _positionwidget(),
          ],
        ),
      ),
    );
  }
}
