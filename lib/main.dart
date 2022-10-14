import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_individual/login.dart';
import 'package:flutter_individual/page.dart';

import 'package:flutter_individual/signUp.dart';
import 'package:flutter_individual/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
