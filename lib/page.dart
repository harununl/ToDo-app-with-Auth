import 'package:flutter/material.dart';
import 'package:flutter_individual/auth.dart';
import 'main.dart';
import 'package:flutter_individual/login.dart';
import 'package:flutter_individual/signUp.dart';

class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => _pageState();
}

AuthService _authService = AuthService();

class _pageState extends State<page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              setState(() {
                _authService.signOut();
              });
            },
            child: Icon(Icons.exit_to_app),
          )),
      body: SafeArea(
        child: Center(child: Text("CONGRATULATIONS!!!")),
      ),
    );
  }
}
