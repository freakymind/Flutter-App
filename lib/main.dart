import 'package:flutter/material.dart';
import './app_screens/login_form.dart';
import 'app_screens/home_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: "Exploring UI widgets",
      
      home: LoginForm(),
    ));
