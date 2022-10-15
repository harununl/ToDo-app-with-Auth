import 'package:flutter/material.dart';
import 'package:flutter_individual/auth.dart';
import 'package:flutter_individual/home.dart';
import 'package:flutter_individual/login.dart';

import 'main.dart';
import 'package:flutter_individual/page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();

  bool _success = false;
  String _message = "";

  @override
  bool passwordVisible = false;
  void initState() {
    // TODO: implement initState
    passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Create an account for free!",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Username',
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0)),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please type an Username";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0)),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please type an Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(
                          Icons.key,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0)),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please type a password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        _formKey.currentState?.validate();
                        _authService
                            .signUp(
                                _emailController.text, _passwordController.text)
                            .then((value) {
                          return Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        });

                        // _register();
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: Text("Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        onTap: () async {
                          await Navigator.pushNamed(context, '/login');
                          Navigator.pop(context, '/signUp');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      _success == null ? '' : _message ?? '',
                      style: TextStyle(
                        color: Colors.amber[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void _register() async {
  //   try {
  //     final UserCredential userCredential =
  //         await auth.createUserWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );

  //     final User user = userCredential.user!;

  // if (user != null) {
  //   setState(() {
  //     _message = "Merhaba, ${user.email}";
  //     _success = true;
  //   });
  // }
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       _message = e.message!;
  //       _success = false;
  //     });
  //   } catch (err) {
  //     print(err.toString());
  //   }
  // }
}
