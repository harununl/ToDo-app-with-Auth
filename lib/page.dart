import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_individual/login.dart';
import 'package:flutter_individual/signUp.dart';

class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(child: Text("CONGRATULATİONS!!!")),
      ),
    );
  }
}
