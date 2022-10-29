import 'package:devapp/constants/colors.dart';
import 'package:devapp/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("user created");
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(children: [
              SizedBox(
                height: height / 20,
              ),
              Row(
                children: [
                  Container(
                      width: width / 1.8,
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ))
                ],
              ),
              SizedBox(
                height: height / 60,
              ),
              Row(
                children: [
                  Container(
                      width: width - 32,
                      child: Text(
                        "Create your new account  ",
                        style: TextStyle(
                            color: myGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ))
                ],
              ),
              SizedBox(
                height: height / 20,
              ),
              Row(
                children: [
                  Text(
                    "Full name",
                    style: TextStyle(
                        color: myBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: height / 60,
              ),
              Row(
                children: [
                  Container(
                      width: width - 36,
                      height: 75,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(25),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                                borderRadius: BorderRadius.circular(20)),
                            filled: true,
                            fillColor: myGrey.withOpacity(0.1),
                            hintText: 'Full name'),
                      )),
                ],
              ),
              SizedBox(
                height: height / 35,
              ),
              Row(
                children: [
                  Text(
                    "Email address",
                    style: TextStyle(
                        color: myBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: height / 60,
              ),
              Row(
                children: [
                  Container(
                      width: width - 36,
                      height: 75,
                      child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(25),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                                borderRadius: BorderRadius.circular(20)),
                            filled: true,
                            fillColor: myGrey.withOpacity(0.1),
                            hintText: 'Email address'),
                      )),
                ],
              ),
              SizedBox(
                height: height / 35,
              ),
              Row(
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        color: myBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: height / 60,
              ),
              Row(
                children: [
                  Container(
                      width: width - 36,
                      height: 75,
                      child: TextFormField(
                        obscureText: true,
                        controller: _password,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(25),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                                borderRadius: BorderRadius.circular(20)),
                            filled: true,
                            fillColor: myGrey.withOpacity(0.1),
                            hintText: 'Password'),
                      )),
                ],
              ),
              SizedBox(
                height: height / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () =>
                        signUp(email: _email.text, password: _password.text),
                    child: Container(
                      width: width / 1.4,
                      height: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: mainColor),
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => LoginScreen())),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: myBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
