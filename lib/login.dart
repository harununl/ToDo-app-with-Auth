import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_individual/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_individual/signUp.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_individual/home.dart';
import 'package:flutter_individual/page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  //_LoginState login = _LoginState();
  bool isChecked = false;
  bool passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    passwordVisible = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[600],
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              Container(
                height: 60.0,
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      labelText: 'Enter your Email',
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please type an Email";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: passwordVisible,
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
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.grey[800],
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                  Text(
                    "Remember me",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 25),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await signIn(
                          _emailController.text, _passwordController.text);

                      if (result != null) {
                        setState(() {
                          Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const page(),
                            ),
                          );
                        });
                      }
                    }
                  },
                  color: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "-OR-",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Sign in With",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FloatingActionButton(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.blue,
                      onPressed: () {
                        //signInWithFacebook();
                      },
                      child: Icon(Icons.facebook),
                      heroTag: null,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.grey[800],
                    onPressed: () async {
                      dynamic result = await signInWithGoogle();

                      if (_formKey.currentState!.validate()) {
                        dynamic result = await signInWithGoogle();

                        if (result != null) {
                          setState(() {
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => const page(),
                              ),
                            );
                          });
                        }
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/google.png'),
                    ),
                    heroTag: null,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Dont  have an account?",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (() async {
                        await Navigator.pushNamed(context, '/signUp');
                        Navigator.pop(context, '/login');
                      }),
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn(String email, String password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Başarıyla giriş yaptınız..')));
      return user.user!;
      //final User user = userCredential.user!;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    } catch (e) {
      print(e.toString());
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      //return await FirebaseAuth.instance.signInWithCredential(credential);
      final user = await _auth.signInWithCredential(credential);
      // final UserCredential userCredential =
      //     await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Başarıyla giriş yaptınız..')));
      // final User? user = userCredential.user;

      return user.user!;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    } catch (e) {
      print(e.toString());
    }
  }
}
