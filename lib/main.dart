import 'package:flutter/material.dart';
import 'package:flutter_individual/login.dart';
import 'package:flutter_individual/page.dart';
import 'package:flutter_individual/signIn.dart';
import 'package:flutter_individual/signUp.dart';
import 'package:flutter_individual/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => home(),
      '/signUp': (context) => signUp(),
      '/login': (context) => Login(),
      '/page': (context) => page(),
    },
  ));
}
