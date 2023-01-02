

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/home.dart';
import 'package:movies/screens/signup_screen.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF1b1f20),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            "Login"
          ),
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),

                //logo
                const DropShadow(
                    blurRadius: 5,
                    offset: Offset(2, 2),
                    spread: 1,
                    child: Icon(
                        Icons.account_circle,
                        size: 125,
                      color: Colors.white,
                    )
                ),


                const SizedBox(height: 30),

                Text(
                  textAlign: TextAlign.center,
                  "Hello there 👋\nHow about logging in first?",
                  style: GoogleFonts.inter(

                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 25),

                //email
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _emailTextController,
                      obscureText: false,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Email ID",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                    )
                ),

                const SizedBox(height: 10),

                //password
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                    )
                ),

                const SizedBox(height: 10),
                DropShadow(
                  blurRadius: 5,
                  offset: const Offset(5, 5),
                  spread: 1,
                  child: Builder(
                    builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: _emailTextController.text, password: _passwordTextController.text).then((value) {
                                  print("Created New Account");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                          },

                          child: Container(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            margin: const EdgeInsets.only(top: 5, bottom: 1, left: 25, right: 25),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )
                            ),
                          )
                      );
                    }
                ),),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    Builder(
                        builder: (context) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                              },
                              child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  )
                              )
                          );
                        }
                    )
                  ],
                )
              ],
            ),
          ),
        )
        ),
    );
  }
}