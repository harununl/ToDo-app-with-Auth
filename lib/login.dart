import 'package:flutter/material.dart';
import 'package:flutter_individual/signIn.dart';
import 'package:flutter_individual/signUp.dart';
import 'package:flutter_individual/home.dart';
import 'package:flutter_individual/page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  bool passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
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
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    labelText: 'Enter your Email',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
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
                    checkColor: Colors.blue,
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
                onPressed: () {
                  Navigator.pushNamed(context, '/page');
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.blue),
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
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    onPressed: () {},
                    child: Icon(Icons.facebook),
                    heroTag: null,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                "Dont  have an account?",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }
}
