import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/user_register.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: LogoImage(),
            ),
          ),
          //   child: Container(
          //   alignment: Alignment.center,
          //   color: Colors.white,
          //   //height: 250.0,
          //   //width: 400.0,
          //   //margin: EdgeInsets.only(bottom: 300.0),
          //   child: Text("Go Pharma",
          //       textDirection: TextDirection.ltr,
          //       style: TextStyle(
          //           color: Colors.blueAccent,
          //           fontFamily: 'RobotoSlab',
          //           fontSize: 50.0,
          //           decoration: TextDecoration.none)),
          // )),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blueAccent,
                    child: LoginButton(),
                    //height: 250.0,
                    //width: 400.0,
                    //margin: EdgeInsets.only(bottom: 300.0),
                    // child: Text("Go Pharma",
                    //     textDirection: TextDirection.ltr,
                    //     style: TextStyle(
                    //         color: Colors.blueAccent,
                    //         fontFamily: 'RobotoSlab',
                    //         fontSize: 50.0,
                    //         decoration: TextDecoration.none)),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blueAccent,
                    child: SignUpButton(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 100.0),
      height: 40.0,
      width: 380.0,
      child: RaisedButton(
          color: Colors.orangeAccent,
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              //height: 15.0,
              fontFamily: 'RobotoSlab',
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 6.0,
          onPressed: () {}),
    );
  }
}

class SignUpButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100.0),
      height: 40.0,
      width: 380.0,
      child: RaisedButton(
          color: Colors.orangeAccent,
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoSlab',
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 6.0,
          onPressed: () {
            print('sign pressed');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserRegisterWidget(),
              ),
            );
          }),
    );
  }
}
