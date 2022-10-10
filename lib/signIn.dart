// import 'dart:io';
// import 'package:flutter_individual/home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_individual/signUp.dart';

// void main() {
//   runApp(MaterialApp(
//     home: createAccount(),
//   ));
// }

// class createAccount extends StatefulWidget {
//   const createAccount({super.key});

//   @override
//   State<createAccount> createState() => _createAccountState();
// }

// class _createAccountState extends State<createAccount> {
//   bool isChecked = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(
//               height: 30,
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Text(
//                 "Sign In",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 40.0,
//                   letterSpacing: 2.0,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               height: 60.0,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                     icon: Icon(
//                       Icons.mail,
//                       color: Colors.white,
//                     ),
//                     labelText: 'Enter your Email',
//                     labelStyle: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold)),
//               ),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             TextFormField(
//               decoration: const InputDecoration(
//                   icon: Icon(Icons.key, color: Colors.white),
//                   labelText: 'Password',
//                   labelStyle: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold)),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: InkWell(
//                 child: Text(
//                   "Forgot password?",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onTap: () {},
//               ),
//             ),
//             Row(
//               children: <Widget>[
//                 Checkbox(
//                     activeColor: Colors.white,
//                     checkColor: Colors.blue,
//                     value: isChecked,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         isChecked = value!;
//                       });
//                     }),
//                 Text(
//                   "Remember me",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.0),
//                 ),
//               ],
//             ),
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(vertical: 25),
//               child: MaterialButton(
//                 minWidth: double.infinity,
//                 height: 60,
//                 onPressed: () {},
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(40)),
//                 child: Text(
//                   "Login",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                       color: Colors.blue),
//                 ),
//               ),
//             ),
//             Column(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "-OR-",
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text("Sign in With",
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold)),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: FloatingActionButton(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.blue,
//                     onPressed: () {},
//                     child: Icon(Icons.facebook),
//                   ),
//                 ),
//                 FloatingActionButton(
//                     backgroundColor: Colors.white,
//                     onPressed: () {},
//                     child: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-RhL0Ik3VZtqgLMFrOrSZ_7s9wRIj6Z0CFQ&usqp=CAU'),
//                     ))
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//               Text(
//                 "Dont  have an account?",
//                 style:
//                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//               InkWell(
//                 child: Text(
//                   "Sign Up",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 onTap: (() {
//                   Navigator.pushNamed(context, '/signUp');
//                 }),
//               )
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
