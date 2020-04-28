import 'package:antiqueecom/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;

  void initState() {
    super.initState();
    isSignedIn();
  }

  isSignedIn() async {
    setState(() {
      loading = true;
    });


    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  /*Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/background/back.jpeg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Antique",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
              key: _formkey,
              child: Form(child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.5),
                      elevation: 0.0,


                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _emailTextController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Please make sure your email address is valid';
                              else
                                return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.5),
                      elevation: 0.0,


                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _passwordTextController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.lock_outline),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password field cannot be empty";
                            }
                            else if (value.length < 6) {
                              return "the password must be atleast 6 characters";
                            }
                            return null;
                          },

                        ),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red,
                      elevation: 0.0,
                      child: MaterialButton(onPressed: () {},
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Text("Login", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),),),
                    ),),
                  Padding(padding: const EdgeInsets.all(8.0),
                    child: Text("Forget Password", textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),),),
                  Padding(padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Signup()));
                          },
                          child: Text('Sign Up', textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.white),),
                        )
                    ),)
                ],
              )),
            ),
          ),

          Visibility(
              visible: loading ?? true,
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
              ))
        ],
      ),

    );
  }
}
