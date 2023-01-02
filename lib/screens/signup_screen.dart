import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1b1f20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up"
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
                offset: Offset(2, 2),
                spread: 1,
                blurRadius: 5,
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 125,
                ),
              ),


              const SizedBox(height: 30),

              Text(
                textAlign: TextAlign.center,
                "Well then, enter your:",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
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
                      hintText: "New Password",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  )
              ),

              const SizedBox(height: 10),
              DropShadow(
                  blurRadius: 5,
                  offset: Offset(5, 5),
                  spread: 1,
                  child: Builder(
                    builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: _emailTextController.text, password: _passwordTextController.text).then((value) {
                            print("Created New Account");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });},
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            margin: const EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                                child: Text(
                                  "Create my account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )
                            ),
                          )
                      );
                    },
                  )),
            ],
          ),
        ),
      )
    );
  }
}
