import 'package:flutter/material.dart';
import './app_screens/login_form.dart';
import 'app_screens/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async => {
  await DotEnv().load('.env'),
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: "Exploring UI widgets",
      home: LoginForm(),
    ))
};