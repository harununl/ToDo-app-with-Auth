import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_individual/login.dart';
import 'package:flutter_individual/page.dart';

import 'package:flutter_individual/signUp.dart';
import 'package:flutter_individual/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
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
